require("telescope").setup({
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--color", "never", "-g", "!.git" },
            hidden = true,
            no_ignore = false,
        },
    },
})
