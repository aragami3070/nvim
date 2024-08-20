local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer = ensure_packer()

return require('packer').startup(function(use)
    -- Vim Package Manager
    use 'wbthomason/packer.nvim'
    -- use 'numirias/semshi' -- :UpdateRemotePlugins

    -- LSP Package Manager
    use {
         "williamboman/mason.nvim",
         Build = ":MasonUpdate",
    }

    use {
        "williamboman/mason-lspconfig.nvim"
    }

    -- Native LSP configuration
    use {
        'neovim/nvim-lspconfig',
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/vim-vsnip',
        'hrsh7th/vim-vsnip-integ',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline'
    }

    -- Fuzzy search
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Non-LSP actions and more
    use {
        'nvimtools/none-ls.nvim',
    }

    -- LSP: Snippets
    use {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    }

    -- LSP signature pop-up
    use 'ray-x/lsp_signature.nvim'

    -- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Pairing brackets
    use 'windwp/nvim-autopairs'

    -- Colorscheme colors retrieval
    use 'psliwka/termcolors.nvim'

    -- Status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- Git integration
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-fugitive'
    use 'rbong/vim-flog'
    use "sindrets/diffview.nvim"

    --VimTex
    use 'lervag/vimtex'

    -- Commenting
    use 'tpope/vim-commentary'

    --Terminal
    use "akinsho/toggleterm.nvim"

    --Comments and ToDo comments 
    use "folke/todo-comments.nvim"
    use "terrortylor/nvim-comment"

    -- bufferline
    use "akinsho/bufferline.nvim"

    -- colorizer #color highlighting
    use 'norcalli/nvim-colorizer.lua'

    -- File explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

   -- Colorscheme
    use 'aragami3070/one-nvim'

    use {
        "scalameta/nvim-metals",
        requires = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
        }
    }

    use {
        "kylechui/nvim-surround",
        tag = "*"
    }

    -- NOTE: DON'T CHANGE  PLS
    --Debug adapter protocol
    use 'mfussenegger/nvim-dap'

    use {
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
    }

    use {
        "rcarriga/nvim-dap-ui",
        -- virtual text for the debugger
        {
            "theHamsta/nvim-dap-virtual-text",
            opts = {},
        },
    }

    use {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
    }

    use {
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
    }

    use {
        "nvim-neotest/nvim-nio"
    }

    use {
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

    if packer then
        require('packer').sync()
    end
end)
