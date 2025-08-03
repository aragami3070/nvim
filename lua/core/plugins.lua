-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {

		-- LSP Package Manager
		{
			"williamboman/mason.nvim",
			Build = ":MasonUpdate",
		},
		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"nvimtools/none-ls.nvim",
			},
		},

		{
			"williamboman/mason-lspconfig.nvim",
		},

		-- Native LSP configuration
		{
			"neovim/nvim-lspconfig",
		},

		-- Completion
		{
			"hrsh7th/nvim-cmp",
			"hrsh7th/vim-vsnip",
			"hrsh7th/vim-vsnip-integ",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
		},

        -- File explorer
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			event = "VeryLazy",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
				"MunifTanjim/nui.nvim", -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			},
		},

		-- Fuzzy search
		{
			"nvim-telescope/telescope.nvim",
			-- version = "0.1.5",
			-- or                            , branch = '0.1.x',
			dependencies = { { "nvim-lua/plenary.nvim" } },
		},

		-- Non-LSP actions and more
		{
			"nvimtools/none-ls.nvim",
		},
		-- LSP: Snippets
		{
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},

		-- LSP signature pop-up
		{ "ray-x/lsp_signature.nvim" },

		-- Syntax highlighting
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
		},

		-- Underscore selected function/var/etc in code
		{
			"RRethy/vim-illuminate",
		},

		-- Pairing brackets
		{ "windwp/nvim-autopairs" },

		-- Colorscheme colors retrieval
		{ "psliwka/termcolors.nvim" },

		-- Status line
		{
			"nvim-lualine/lualine.nvim",
			dependencies = "nvim-tree/nvim-web-devicons",
		},

		-- Git integration
		{ "lewis6991/gitsigns.nvim" },
		{ "tpope/vim-fugitive" },
		{ "rbong/vim-flog" },
		{ "sindrets/diffview.nvim" },


		--Comments and ToDo comments
		{ "folke/todo-comments.nvim" },
		{
			"folke/ts-comments.nvim",
			opts = {},
			event = "VeryLazy",
			enabled = vim.fn.has("nvim-0.10.0") == 1,
		},
		-- bufferline
		{ "akinsho/bufferline.nvim" },

		{ "petertriho/nvim-scrollbar" },

		{
			"folke/which-key.nvim",
			event = "VeryLazy",
			opts_extend = { "spec" },
			opts = {
				defaults = {},
				spec = {
					{
						mode = { "n" },
						{ "<leader>c", group = "Comments" },
						{ "<leader>g", group = "Git" },
						{ "[", group = "Prev" },
						{ "]", group = "Next" },
						{ "<space>p", group = "Goto-preview" },
						{ "<space>l", group = "Find file by" },
						{ "<space>t", group = "Timer" },
						{ "<space>o", group = "Obsidian" },
						{ "<space>z", group = "Trouble" },
						{ "<space>oto", group = "Today/Tomorrow" },
						{ "<space>s", group = "Spectre (like Ctrl+f but in all files)" },
						{ "<space>n", group = "Rename word" },
						{ "<space>.", group = "Noice Last/History message" },
						{ "<space>d", group = "Debugger" },
						{ "<space>ds", group = "Debugger CMake start" },
						{ "z", group = "Fold" },
						{ "<space>cl", desc = "Comment line" },
						{ "<space>c", desc = "Comment highlighted lines" },
						{ "<space>pd", desc = "Preview Definition" },
						{ "<space>pt", desc = "Preview Type Definition" },
						{ "<space>pi", desc = "Preview Implementation" },
						{ "<space>pr", desc = "Preview References" },
						{ "<space>pc", desc = "Close Previews" },
						{
							"<leader>w",
							group = "windows",
							proxy = "<c-w>",
							expand = function()
								return require("which-key.extras").expand.win()
							end,
						},
					},
				},
			},
			keys = {
				{
					"<leader>",
					function()
						require("which-key").show({ keys = "<space>", loop = false, global = true })
					end,
					desc = "Space Keymaps",
				},
			},
			config = function(_, opts)
				local wk = require("which-key")
				wk.setup(opts)
			end,
		},


		-- Colorscheme
		{ "aragami3070/one-nvim" },

		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest featuresevent
		},

		{
			"shellRaining/hlchunk.nvim",
			event = { "UIEnter" },
		},

		{
			"rachartier/tiny-inline-diagnostic.nvim",
			event = "VeryLazy", -- Or `LspAttach`
			priority = 1000, -- needs to be loaded in first
			config = function()
				require("tiny-inline-diagnostic").setup()
			end,
		},

		{
			"folke/flash.nvim",
			event = "VeryLazy",
			---@type Flash.Config
			opts = {},
			-- stylua: ignore
			 keys = {
				{ "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
				{ "<leader>k", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
				{ "<leader>J", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
				{ "<leader>K", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
				{ "<leader>,", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
			},
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
