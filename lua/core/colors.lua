vim.opt.termguicolors = true
local set = vim.api.nvim_set_hl

vim.cmd.colorscheme("one-nvim")
local function fix_colors()
    set(0, "Normal", { bg = "none" })
    set(0, "NormalFloat", { bg = "none" })
    set(0, "SignColumn", { bg = "none" })
    set(0, "TabLineFill", { bg = "none" })

    -- NOTE:(nrydanov) Temporary treesitter fix
    set(0, "@variable", { fg = "#98c379" })

    -- links to StorageClass

    -- HACK: fix dap colors

    -- Red
    set(0, "DapUIStop", { default = true, link = "WarningMsg", force = true })
    set(0, "DapUIStopNC", { default = true, link = "WarningMsg", force = true })
    -- Blue
    set(0, "DapUIStepOutNC", { default = true, link = "Include", force = true })
    set(0, "DapUIStepBackNC", { default = true, link = "Include", force = true })
    set(0, "DapUIStepIntoNC", { default = true, link = "Include", force = true })
    set(0, "DapUIStepOverNC", { default = true, link = "Include", force = true })
    set(0, "DapUIStepOut", { default = true, link = "Include", force = true })
    set(0, "DapUIStepBack", { default = true, link = "Include", force = true })
    set(0, "DapUIStepInto", { default = true, link = "Include", force = true })
    set(0, "DapUIStepOver", { default = true, link = "Include", force = true })
    -- Green
    set(0, "DapUIRestart", { default = true, link = "Constant", force = true })
    set(0, "DapUIPlayPause", { default = true, link = "Constant", force = true })
    set(0, "DapUIRestartNC", { default = true, link = "Constant", force = true })
    set(0, "DapUIPlayPauseNC", { default = true, link = "Constant", force = true })

    -- #98c379
    set(0, "DapUIVariable", { default = true, link = "@variable", force = true })

    -- Violet
    set(0, "DapUIValue", { default = true, link = "boolean", force = true })
    set(0, "NvimDapVirtualTextChanged", { default = true, link = "boolean", force = true })
end

local function fix_rust_colors()
    set(0, "rustSigil", { default = true, link = "Include", force = true })
    set(0, "rustStorage", { default = true, link = "Keyword", force = true })
    set(0, "@lsp.typemod.const.procMacro.rust", { default = true, link = "@variable", force = true })
end

local function fix_toml_colors()
    set(0, "tomlTable", { default = true, link = "Keyword", force = true })
end

local function fix_typst_colors()
    set(0, "typstMarkupHeading", { default = true, link = "FloatTitle", force = true })
    set(0, "typstMarkupBulletList", { default = true, link = "Include", force = true })
    set(0, "typstCodeDollar", { default = true, link = "Function", force = true })
    -- set(0, "typstCodeDollar", { default = true, link = "Function", force = true })
    set(0, "typstMathIdentifier", { default = true, link = "String", force = true })
    set(0, "typstCodeIdentifier", { default = true, link = "String", force = true })
end

fix_colors()
fix_rust_colors()
fix_toml_colors()
fix_typst_colors()
