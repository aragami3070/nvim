require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		-- "bashls",
	},
})
