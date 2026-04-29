require("oil").setup({
    default_file_explorer = true,
    -- Id is automatically added at the beginning, and name at the end
    -- See :help oil-columns
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    delete_to_trash = false,
    use_default_keymaps = false,
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<space>ps"] = { "actions.select", opts = { vertical = true } },
        ["<space>pp"] = "actions.preview",
        ["<space>pc"] = { "actions.close", mode = "n" },
        ["<space>pl"] = "actions.refresh",
        ["<BS>"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["g."] = { "actions.toggle_hidden", mode = "n" },
    },
    view_options = {
        show_hidden = true,
    },
})
