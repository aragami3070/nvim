require("conform").setup({
	formatters_by_ft = {
		csharp = { "csharpier" },
		lua = { "stylua" },
		cpp = { "clang_format" },
		typ = { "typstfmt" },
		vue = { "prettier" },
		js = { "prettier" },
		ts = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "-style=file:" .. vim.fn.expand("~/.config/nvim/.clang-format") },
		},
	},
	-- format_on_save = {
	--   lsp_fallback = true,
	--   async = false,
	--   timeout_ms = 500,
	-- },
})
