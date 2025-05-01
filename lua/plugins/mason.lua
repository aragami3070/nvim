require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"omnisharp",
		"clangd",
		"texlab",
		"neocmake",
		"markdown_oxide",
		"ts_ls",
		"cssls",
		"html",
		"tinymist",
		"bashls",
		"asm_lsp",
		"volar",
	},
})

require("mason-nvim-dap").setup({
	ensure_installed = {
		"codelldb",
		"netcoredbg",
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"clang_format",
		"csharpier",
		"prettier",
		"stylua",
		"typstfmt",
	},
})
