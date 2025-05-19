require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		-- "roslynv4", -- NOTE: пока ставим руками, мб потом придумаю что-нибудь
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
