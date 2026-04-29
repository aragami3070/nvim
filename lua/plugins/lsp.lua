local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.enable({
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
