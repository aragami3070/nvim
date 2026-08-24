local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.config("rust_analyzer", {
    before_init = require("utils.rust_features").before_init,
})

vim.lsp.enable({
    "rust_analyzer",
    "lua_ls",
    "clangd",
    "texlab",
    "neocmake",
    "cssls",
    "html",
    "markdown_oxide",
    "tinymist",
    "bashls",
    "ts_ls",
})
