local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable({
	"lua_ls",
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
	"millet",
})

vim.lsp.config("*", {
	capabilities = capabilities,
})
