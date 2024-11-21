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
        "williamboman/mason-lspconfig.nvim"
    },

    -- Native LSP configuration
    {
        'neovim/nvim-lspconfig',
    },

    -- Completion
    {
        'hrsh7th/nvim-cmp',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline'
    },

    -- Fuzzy search
    {
        'nvim-telescope/telescope.nvim', version = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    -- Non-LSP actions and more
    {
        'nvimtools/none-ls.nvim',
    },

    -- LSP: Snippets
    {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },

    {
        "rmagatti/goto-preview",
        event = "BufEnter",
        config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
        keys = {
                -- NOTE: Added goto-preview keymaps (best plugin ever)
                { '<space>pd', function() require("goto-preview").goto_preview_definition() end, { desc = "Preview Definition", silent = true } },
                { '<space>pt', function() require("goto-preview").goto_preview_type_definition() end, { desc = "Preview Type Definition", silent = true } },
                { '<space>pi', function() require("goto-preview").goto_preview_type_definition() end, { desc = "Preview Implementation", silent = true } },
                { '<space>pr', function() require("goto-preview").goto_preview_references() end, { desc = "Preview References", silent = true } },
                { '<space>pc', function() require("goto-preview").close_all_win() end, { desc = "Close Previews", silent = true } },
            }
    },

    -- LSP signature pop-up
    {'ray-x/lsp_signature.nvim'},

    -- Syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- Underscore selected function/var/etc in code
    {
        "RRethy/vim-illuminate"
    },

    -- Rename plugin
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
    },

    -- Rename in all files plugin

    {
        'nvim-pack/nvim-spectre',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Preview markdown (install without yarn or npm)
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    -- Pairing brackets
    {'windwp/nvim-autopairs'},

    -- Colorscheme colors retrieval
    {'psliwka/termcolors.nvim'},

    -- Status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    -- Git integration
    {'lewis6991/gitsigns.nvim'},
    {'tpope/vim-fugitive'},
    {'rbong/vim-flog'},
    {"sindrets/diffview.nvim"},

    --VimTex
    {'lervag/vimtex'},

    -- Commenting
    {'tpope/vim-commentary'},

    --Terminal
    {"akinsho/toggleterm.nvim"},

    --Comments and ToDo comments 
    {"folke/todo-comments.nvim"},
    {"terrortylor/nvim-comment"},

    -- bufferline
    {"akinsho/bufferline.nvim"},

    -- nvim-navic line 
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig"
    },

    -- barbecue (extended nvim-navic)
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {

        }
    },

    {"petertriho/nvim-scrollbar"},

 {"folke/which-key.nvim",
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
        { "<space>oto", group = "Today/Tomorrow" },
        { "<space>s", group = "Spectre (like Ctrl+f but in all files)" },
        { "<space>n", group = "Rename word" },
        { "<space>.", group = "Noice Last/History message" },
        { "<space>d", group = "Debugger" },
        { "<space>ds", group = "Debugger CMake start" },
        { "z", group = "Fold" },
        { "<space>cl", desc = "Comment line"},
        { "<space>c", desc = "Comment highlighted lines"},
        { '<space>pd',  desc = "Preview Definition" },
        { '<space>pt',  desc = "Preview Type Definition" },
        { '<space>pi',  desc = "Preview Implementation" },
        { '<space>pr',  desc = "Preview References" },
        { '<space>pc',  desc = "Close Previews" },
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
  version = "*",  -- Recommended, use latest release instead of latest commit
  lazy = true,
  cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
  dependencies = {
    -- Optional, but highly recommended if you want to use the "Default" timer
    "rcarriga/nvim-notify",
  },
},

    -- notify
    { 'rcarriga/nvim-notify' },

    -- Obsidian.nvim
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
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
    {'norcalli/nvim-colorizer.lua'},

    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },

   -- Colorscheme
    {'aragami3070/one-nvim'},

    {
        "scalameta/nvim-metals",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        }
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest featuresevent
    },

    {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { {'nvim-tree/nvim-web-devicons'}}
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
        }
    },

	{ 'Civitasv/cmake-tools.nvim' },

    {
        "shellRaining/hlchunk.nvim",
        event = { "UIEnter" },
    },

    { 'ray-x/web-tools.nvim' },

    {
        'chomosuke/typst-preview.nvim',
        -- lazy = false, -- or ft = 'typst'
        ft = 'typst',
        version = '0.3.*',
        build = function() require 'typst-preview'.update() end,
    },
{
  "folke/trouble.nvim",
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
},


    -- NOTE: DON'T CHANGE  PLS
    --Debug adapter protocol
    {'mfussenegger/nvim-dap'},

    {
        "mfussenegger/nvim-dap",
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
        opts = {},
    },

    {
        "rcarriga/nvim-dap-ui",
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
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },

    {
        "nvim-neotest/nvim-nio"
    },

    {
        "jay-babu/mason-nvim-dap.nvim",
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
        config = function()
        end,
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

