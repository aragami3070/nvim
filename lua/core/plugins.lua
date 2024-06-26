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
        Build = ":MasonUpdate"
    }

    -- Native LSP configuration
    use {
        'neovim/nvim-lspconfig',
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
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

    --Debug adapter protocol
    -- TODO: add dap & dap ui & etc
    -- FIX: may be good setup here https://github.com/SteveWolligandt/dotfiles/tree/master
    -- use 'mfussenegger/nvim-dap'

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

    if packer then
        require('packer').sync()
    end
end)
