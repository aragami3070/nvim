local M = {}

local function notify(message, level)
    vim.notify(message, level or vim.log.levels.INFO, { title = "Rust features" })
end

local function normalize_path(path)
    return vim.fn.fnamemodify(path, ":p")
end

local function split_features(value)
    local features = {}

    for feature in value:gmatch("[^,%s]+") do
        table.insert(features, feature)
    end

    return features
end

local function toml_array(values)
    return vim.json.encode(values)
end

local function parse_toml_value(value)
    value = value:gsub("%s+#.*$", ""):gsub("^%s+", ""):gsub("%s+$", "")

    if value == "true" then
        return true
    elseif value == "false" then
        return false
    elseif value == "\"all\"" or value == "'all'" then
        return "all"
    end

    if value:sub(1, 1) == "[" and value:sub(-1) == "]" then
        local ok, parsed = pcall(vim.json.decode, value)
        if ok and type(parsed) == "table" then
            return parsed
        end

        local parsed = {}
        for item in value:gmatch("['\"]([^'\"]+)['\"]") do
            table.insert(parsed, item)
        end
        return parsed
    end

    return nil
end

local function read_project_settings(root)
    local path = normalize_path(root) .. "/rust-analyzer.toml"
    local file = io.open(path, "r")
    if not file then
        return nil
    end

    local contents = file:read("*a")
    file:close()

    local key_names = {
        features = "features",
        noDefaultFeatures = "noDefaultFeatures",
        no_default_features = "noDefaultFeatures",
        allTargets = "allTargets",
        all_targets = "allTargets",
    }
    local settings = {
        cargo = {},
        check = {},
    }
    local section

    for _, line in ipairs(vim.split(contents, "\n", { plain = true })) do
        local new_section = line:match("^%s*%[([^%]]+)%]%s*$")
        if new_section then
            section = settings[new_section] and new_section or nil
        elseif section then
            local key, value = line:match("^%s*([%w_]+)%s*=%s*(.-)%s*$")
            local normalized_key = key and key_names[key]
            if normalized_key then
                local parsed = parse_toml_value(value)
                if parsed ~= nil then
                    settings[section][normalized_key] = parsed
                end
            end
        end
    end

    if next(settings.cargo) == nil and next(settings.check) == nil then
        return nil
    end

    return settings
end

local function append_missing_keys(output, section, values, replaced)
    for _, key in ipairs({ "features", "noDefaultFeatures", "allTargets" }) do
        if not replaced[key] then
            table.insert(output, key .. " = " .. values[key])
        end
    end
end

local function update_rust_analyzer_toml(root, profile)
    local path = normalize_path(root) .. "/rust-analyzer.toml"
    local file = io.open(path, "r")
    local contents = ""

    if file then
        contents = file:read("*a")
        file:close()
    end

    local values = {
        features = toml_array(profile.features),
        noDefaultFeatures = tostring(profile.noDefaultFeatures),
        allTargets = "false",
    }
    local sections = {
        cargo = true,
        check = true,
    }
    local lines = contents == "" and {} or vim.split(contents, "\n", { plain = true })
    local output = {}
    local current_section
    local found_sections = {}
    local replaced = {}

    local function finish_section()
        if current_section and sections[current_section] then
            append_missing_keys(output, current_section, values, replaced[current_section])
        end
    end

    for _, line in ipairs(lines) do
        local section = line:match("^%s*%[([^%]]+)%]%s*$")
        if section then
            finish_section()
            current_section = section
            if sections[section] then
                found_sections[section] = true
                replaced[section] = replaced[section] or {}
            end
            table.insert(output, line)
        elseif current_section and sections[current_section] then
            local key = line:match("^%s*([%w]+)%s*=")
            if values[key] then
                if not replaced[current_section][key] then
                    table.insert(output, key .. " = " .. values[key])
                    replaced[current_section][key] = true
                end
            else
                table.insert(output, line)
            end
        else
            table.insert(output, line)
        end
    end

    finish_section()

    for _, section in ipairs({ "cargo", "check" }) do
        if not found_sections[section] then
            if #output > 0 and output[#output] ~= "" then
                table.insert(output, "")
            end
            table.insert(output, "[" .. section .. "]")
            append_missing_keys(output, section, values, {})
        end
    end

    local new_contents = table.concat(output, "\n")
    if not new_contents:match("\n$") then
        new_contents = new_contents .. "\n"
    end

    local parent = vim.fn.fnamemodify(path, ":h")
    vim.fn.mkdir(parent, "p")

    file = io.open(path, "w")
    if not file then
        notify("Не удалось записать " .. path, vim.log.levels.ERROR)
        return false
    end

    file:write(new_contents)
    file:close()
    return true
end

local function load_metadata(root)
    local result = vim.system({
        "cargo",
        "metadata",
        "--no-deps",
        "--format-version",
        "1",
    }, {
        cwd = root,
        text = true,
    }):wait()

    if result.code ~= 0 then
        local stderr = result.stderr or ""
        local details = stderr ~= "" and stderr or "cargo metadata завершился с ошибкой"
        notify(details:gsub("%s+$", ""), vim.log.levels.ERROR)
        return nil
    end

    local ok, metadata = pcall(vim.json.decode, result.stdout)
    if not ok or type(metadata) ~= "table" then
        notify("Не удалось разобрать вывод cargo metadata", vim.log.levels.ERROR)
        return nil
    end

    return metadata
end

local function current_client()
    local clients = vim.lsp.get_clients({ bufnr = 0, name = "rust_analyzer" })
    return clients[1]
end

local function current_root()
    local client = current_client()
    if client and client.config.root_dir then
        return normalize_path(client.config.root_dir), client
    end

    local root = vim.fs.root(0, { "Cargo.toml" })
    if root then
        return normalize_path(root), nil
    end

    return nil, nil
end

local function apply_profile(root, profile)
    if not update_rust_analyzer_toml(normalize_path(root), profile) then
        return
    end

    local feature_text = #profile.features > 0 and table.concat(profile.features, ", ") or "Cargo defaults"
    notify("Выбрано: " .. feature_text)

    if current_client() then
        for _, client in ipairs(vim.lsp.get_clients({ name = "rust_analyzer" })) do
            vim.lsp.stop_client(client.id, true)
        end

        vim.defer_fn(function()
            vim.lsp.enable("rust_analyzer")
        end, 100)
    end
end

local function choose_custom(root)
    vim.ui.input({
        prompt = "Features через пробел или запятую: ",
    }, function(input)
        if input == nil then
            return
        end

        local features = split_features(input)
        if #features == 0 then
            notify("Нужно указать хотя бы одну feature", vim.log.levels.WARN)
            return
        end

        vim.ui.select({
            { label = "Отключить default features", value = true },
            { label = "Оставить default features", value = false },
        }, {
            prompt = "Default features:",
            format_item = function(item)
                return item.label
            end,
        }, function(choice)
            if choice then
                apply_profile(root, {
                    features = features,
                    noDefaultFeatures = choice.value,
                })
            end
        end)
    end)
end

function M.before_init(params, config)
    local root = config.root_dir

    if type(root) ~= "string" and params then
        if params.workspaceFolders and params.workspaceFolders[1] then
            root = vim.uri_to_fname(params.workspaceFolders[1].uri)
        elseif params.rootUri then
            root = vim.uri_to_fname(params.rootUri)
        end
    end

    local project_settings = root and read_project_settings(root)
    if not project_settings then
        return
    end

    config.settings = config.settings or {}
    local rust_analyzer = config.settings["rust-analyzer"] or {}

    for section, values in pairs(project_settings) do
        rust_analyzer[section] = rust_analyzer[section] or {}
        for key, value in pairs(values) do
            rust_analyzer[section][key] = value
        end
    end

    config.settings["rust-analyzer"] = rust_analyzer
    params.initializationOptions = rust_analyzer
end

local function workspace_features(metadata)
    local names = {}
    local seen = {}

    for _, package in ipairs(metadata.packages or {}) do
        for name in pairs(package.features or {}) do
            if name ~= "default" and not seen[name] then
                seen[name] = true
                table.insert(names, name)
            end
        end
    end

    table.sort(names)
    return names
end

local function choose_features(root, feature_names)
    local selected = {}

    local function selected_values()
        local values = {}

        for _, name in ipairs(feature_names) do
            if selected[name] then
                table.insert(values, name)
            end
        end

        return values
    end

    local function open_picker()
        local values = selected_values()
        local selected_label = #values > 0 and table.concat(values, ", ") or "ничего"
        local choices = {
            {
                kind = "apply",
                label = "Применить: " .. selected_label,
            },
            {
                kind = "defaults",
                label = "Cargo defaults",
            },
        }

        for _, name in ipairs(feature_names) do
            table.insert(choices, {
                kind = "feature",
                name = name,
                label = string.format("[%s] %s", selected[name] and "x" or " ", name),
            })
        end

        table.insert(choices, { kind = "custom", label = "Custom..." })

        vim.ui.select(choices, {
            prompt = "Выбери features (можно несколько):",
            format_item = function(item)
                return item.label
            end,
        }, function(choice)
            if not choice then
                return
            end

            if choice.kind == "apply" then
                if #values == 0 then
                    notify("Выбери feature или используй Cargo defaults", vim.log.levels.WARN)
                    return
                end

                apply_profile(root, {
                    features = values,
                    noDefaultFeatures = true,
                })
            elseif choice.kind == "defaults" then
                apply_profile(root, {
                    features = {},
                    noDefaultFeatures = false,
                })
            elseif choice.kind == "custom" then
                choose_custom(root)
            else
                selected[choice.name] = not selected[choice.name]
                vim.schedule(open_picker)
            end
        end)
    end

    open_picker()
end

function M.select()
    local root = current_root()
    if not root then
        notify("Не удалось определить Cargo project root", vim.log.levels.ERROR)
        return
    end

    local metadata = load_metadata(root)
    if not metadata then
        return
    end

    local config_root = metadata.workspace_root or root

    local feature_names = workspace_features(metadata)
    if #feature_names == 0 then
        notify("В текущем Cargo-проекте features не найдены", vim.log.levels.WARN)
        return
    end

    choose_features(config_root, feature_names)
end

return M
