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
		{
			"seblyng/roslyn.nvim",
			event = "VeryLazy",
			ft = "cs",
			---@module 'roslyn.config'
			---@type RoslynNvimConfig
		},
		-- LSP: Snippets
		{
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},

		{
			"rmagatti/goto-preview",
			event = "BufEnter",
			config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
			keys = {
				-- NOTE: Added goto-preview keymaps (best plugin ever)
				{
					"<space>pd",
					function()
						require("goto-preview").goto_preview_definition()
					end,
					{ desc = "Preview Definition", silent = true },
				},
				{
					"<space>pt",
					function()
						require("goto-preview").goto_preview_type_definition()
					end,
					{ desc = "Preview Type Definition", silent = true },
				},
				{
					"<space>pi",
					function()
						require("goto-preview").goto_preview_type_definition()
					end,
					{ desc = "Preview Implementation", silent = true },
				},
				{
					"<space>pr",
					function()
						require("goto-preview").goto_preview_references()
					end,
					{ desc = "Preview References", silent = true },
				},
				{
					"<space>pc",
					function()
						require("goto-preview").close_all_win()
					end,
					{ desc = "Close Previews", silent = true },
				},
			},
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

		-- Rename in all files plugin
		{
			"nvim-pack/nvim-spectre",
			dependencies = { "nvim-lua/plenary.nvim" },
		},

		-- Preview markdown (install without yarn or npm)
		{
			"iamcco/markdown-preview.nvim",
			cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
			ft = { "markdown" },
			build = function()
				vim.fn["mkdp#util#install"]()
			end,
		},

		-- Pairing brackets
		{ "windwp/nvim-autopairs" },
		{ "windwp/nvim-ts-autotag" },

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

		--VimTex
		{ "lervag/vimtex" },

		--Terminal
		{ "akinsho/toggleterm.nvim" },

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

		-- nvim-navic line
		{
			"SmiteshP/nvim-navic",
			dependencies = "neovim/nvim-lspconfig",
		},

		-- barbecue (extended nvim-navic)
		{
			"utilyre/barbecue.nvim",
			name = "barbecue",
			version = "*",
			event = "VeryLazy",
			dependencies = {
				"SmiteshP/nvim-navic",
				"nvim-tree/nvim-web-devicons", -- optional dependency
			},
			opts = {},
		},

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

		-- pomo (timer) plugin
		{
			"epwalsh/pomo.nvim",
			version = "*", -- Recommended, use latest release instead of latest commit
			lazy = true,
			cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
			dependencies = {
				-- Optional, but highly recommended if you want to use the "Default" timer
				"rcarriga/nvim-notify",
			},
		},

		-- notify
		{ "rcarriga/nvim-notify" },

		-- Obsidian.nvim
		{
			"epwalsh/obsidian.nvim",
			version = "*", -- recommended, use latest release instead of latest commit
			lazy = true,
			ft = "markdown",
			-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
			-- event = {
			--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
			--   -- refer to `:h file-pattern` for more examples
			--   "BufReadPre path/to/my-vault/*.md",
			--   "BufNewFile path/to/my-vault/*.md",
			-- },
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		-- colorizer #color highlighting
		{ "norcalli/nvim-colorizer.lua" },

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

		-- Colorscheme
		{ "aragami3070/one-nvim" },
		{ "EdenEast/nightfox.nvim" },

		{
			"scalameta/nvim-metals",
			event = "VeryLazy",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"mfussenegger/nvim-dap",
			},
		},

		{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest featuresevent
		},

		{
			"nvimdev/dashboard-nvim",
			event = "VimEnter",
			dependencies = { { "nvim-tree/nvim-web-devicons" } },
		},

		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {
				-- add any options here
			},
			dependencies = {
				-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
				"MunifTanjim/nui.nvim",
				-- OPTIONAL:
				--   `nvim-notify` is only needed, if you want to use the notification view.
				--   If not available, we use `mini` as the fallback
				"rcarriga/nvim-notify",
			},
		},

		{ "Civitasv/cmake-tools.nvim" },

		{
			"shellRaining/hlchunk.nvim",
			event = { "UIEnter" },
		},

		{
			"chomosuke/typst-preview.nvim",
			-- lazy = false, -- or ft = 'typst'
			ft = "typst",
			event = "VeryLazy",
			-- version = "0.3.*",
			build = function()
				require("typst-preview").update()
			end,
		},

		{
			"ethersync/ethersync-nvim",
			keys = { { "<leader>et", "<cmd>EthersyncJumpToCursor<cr>" } },
			lazy = false,
		},

		{
			"folke/trouble.nvim",
			opts = {}, -- for default options, refer to the configuration section for custom setup.
			event = "VeryLazy",
			cmd = "Trouble",
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
			"chrisgrieser/nvim-scissors",
			event = "VeryLazy",
			dependencies = "nvim-telescope/telescope.nvim",
		},

		{
			"stevearc/conform.nvim",
			event = { "BufReadPre", "BufNewFile" },
			opts = {},
		},
		{
			"luckasRanarison/nvim-devdocs",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
				"nvim-treesitter/nvim-treesitter",
			},
		},
		{
			"pmizio/typescript-tools.nvim",
			dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
			opts = {},
		},
		{
			"ravitemer/mcphub.nvim",
			enabled = false,
			dependencies = {
				"nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
			},
			-- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
			build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
		},
		{
			"yetone/avante.nvim",
			event = "VeryLazy",
			version = false, -- Never set this value to "*"! Never!
			enabled = false,
			opts = {
				-- add any opts here
				-- for example
				provider = "openai",
				openai = {
					endpoint = "https://api.deepseek.com",
					model = "deepseek-chat", -- your desired model (or use gpt-4o, etc.)
					timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
					temperature = 0.7,
					max_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
					--reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
				},
			},
			-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
			build = "make",
			-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"stevearc/dressing.nvim",
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				{
					-- support for image pasting
					"HakonHarnes/img-clip.nvim",
					event = "VeryLazy",
					opts = {
						-- recommended settings
						default = {
							embed_image_as_base64 = false,
							prompt_for_file_name = false,
							drag_and_drop = {
								insert_mode = true,
							},
							-- required for Windows users
							use_absolute_path = true,
						},
					},
				},
				{
					-- Make sure to set this up properly if you have lazy=true
					"MeanderingProgrammer/render-markdown.nvim",
					opts = {
						enabled = false,
						file_types = { "markdown", "Avante" },
					},
					ft = { "markdown", "Avante" },
				},
			},
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

		{
			"supermaven-inc/supermaven-nvim",
		},

		{
			"saecki/crates.nvim",
			event = { "BufRead Cargo.toml" },
			config = function()
				require("crates").setup()
			end,
		},

		{
			"jbyuki/venn.nvim",
		},

		-- NOTE: DON'T CHANGE  PLS
		--Debug adapter protocol
		{ "mfussenegger/nvim-dap" },

		{
			"mfussenegger/nvim-dap",
			event = "VeryLazy",
			recommended = true,
			desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

			dependencies = {
				"rcarriga/nvim-dap-ui",
				-- virtual text for the debugger
				{
					"theHamsta/nvim-dap-virtual-text",
					opts = {},
				},
			},

			config = function()
				vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

				-- setup dap config by VsCode launch.json file
				local vscode = require("dap.ext.vscode")
				local json = require("plenary.json")
				vscode.json_decode = function(str)
					return vim.json.decode(json.json_strip_comments(str))
				end
			end,
		},
		{
			"rcarriga/nvim-dap-ui",
			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},

		{
			"theHamsta/nvim-dap-virtual-text",
			event = "VeryLazy",
			opts = {},
		},

		{
			"rcarriga/nvim-dap-ui",
			event = "VeryLazy",
			dependencies = {
				"nvim-neotest/nvim-nio",
				"theHamsta/nvim-dap-virtual-text",
			},
        -- stylua: ignore
        opts = {},
			config = function(_, opts)
				local dap = require("dap")
				local dapui = require("dapui")
				dapui.setup(opts)
				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open({})
				end
			end,
		},

		{
			"nvim-neotest/nvim-nio",
			event = "VeryLazy",
		},

		{
			"jay-babu/mason-nvim-dap.nvim",
			event = "VeryLazy",
			dependencies = "mason.nvim",
			cmd = { "DapInstall", "DapUninstall" },
			opts = {
				-- Makes a best effort to setup the various debuggers with
				-- reasonable debug configurations
				automatic_installation = true,

				-- You can provide additional configuration to the handlers,
				-- see mason-nvim-dap README for more information
				handlers = {},

				-- You'll need to check that you have the required things installed
				-- online, please don't ask me how to install them :)
				ensure_installed = {
					-- Update this to ensure that you have the debuggers for the langs you want
				},
			},
			-- mason-nvim-dap is loaded when nvim-dap loads
			config = function() end,
		},
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
