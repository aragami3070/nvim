require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "cpp",
        "rust",
        "lua",
        "markdown",
        "typst",
        "html",
        "css",
        "javascript",
        "typescript",
        "dockerfile",
        "bash",
        "json5",
        "markdown_inline",
    },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true },
    auto_install = true,
    ignore_install = { "latex" }, -- List of parsers to ignore installing
})
