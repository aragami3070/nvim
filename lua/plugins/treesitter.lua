require "nvim-treesitter.configs".setup {
    ensure_installed = { 'cpp', 'c_sharp', 'kotlin', 'svelte', 'lua', 'python'},--, 'latex' },
    sync_install = false,
    highlight = {
        enable = true,
        -- HACK: latex work
        disable = { "latex", "markdown", "cls" }
    },
    indent = { enable = true },
    auto_install = true,
    -- HACK: latex work
    ignore_install = { "latex" }, -- List of parsers to ignore installing
}
