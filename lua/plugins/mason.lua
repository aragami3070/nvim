require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "omnisharp", "clangd", "texlab", "neocmake", "markdown_oxide", "ts_ls", "cssls", "html", "asm_lsp", "tinymist" },
}
