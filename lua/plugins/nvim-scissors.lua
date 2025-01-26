vim.g.vsnip_snippet_dirs = { vim.fn.stdpath("config").. "/snippets/" }
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config").. "/snippets/" } })
require("scissors").setup {
	snippetDir = vim.fn.stdpath("config").. "/snippets/",
	editSnippetPopup = {
		height = 0.5, -- relative to the window, between 0-1
		width = 0.6,
		border = "rounded",
		keymaps = {
			-- if not mentioned otherwise, the keymaps apply to normal mode
			cancel = "q",
			saveChanges = "<CR>", -- alternatively, can also use `:w`
			goBackToSearch = "<BS>",
			deleteSnippet = "<C-BS>",
			duplicateSnippet = "<C-d>",
			openInFile = "<C-o>",
			insertNextPlaceholder = "<C-p>", -- insert & normal mode
			showHelp = "?",
		},
	},
	telescope = {
		-- By default, the query only searches snippet prefixes. Set this to
		-- `true` to also search the body of the snippets.
		alsoSearchSnippetBody = false,

		-- accepts the common telescope picker config
		-- opts = {
		-- 	layout_strategy = "horizontal",
		-- 	layout_config = {
		-- 		horizontal = { width = 0.9 },
		-- 		preview_width = 0.6,
		-- 	},
		-- },
	},

	-- `none` writes as a minified json file using `vim.encode.json`.
	-- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
	-- you version control your snippets. To use a custom formatter, set to a
	-- list of strings, which will then be passed to `vim.system()`.
	---@type "yq"|"jq"|"none"|string[]
	jsonFormatter = "none",

	backdrop = {
		enabled = true,
		blend = 50, -- between 0-100
	},
	icons = {
		scissors = "󰩫",
	},
}
