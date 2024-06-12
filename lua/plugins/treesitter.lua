require "nvim-treesitter.configs".setup {
    ensure_installed = { 'cpp', 'kotlin', 'svelte', 'lua', 'python'},--, 'latex' },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
    auto_install = true,
}
