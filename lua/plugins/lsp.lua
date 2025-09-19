local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
vim.lsp.enable({
	"luals",
	"clangd",
	"texlab",
	"neocmake",
	"cssls",
	"html",
	"markdown_oxide",
	"asm_lsp",
	"tinymist",
	"bashls",
	"ts_ls",
	"vue_ls"
})

vim.lsp.config("*", {
	capabilities = capabilities,
})
