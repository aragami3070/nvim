# My neovim config README シ 

(WORK IN PROGRESS 👀)

# Table of Contents

- [Requirements](#Requirements)
- [My dirs settings](#My-dirs-settings)
- [Base plugins](#Base-plugins)
    - [Package manager](#Package-manager)
    - [neo-tree](#neo-tree)
    - [treesitter](#treesitter)
    - [lsp, cmp, mason, navic](#lsp-cmp-mason-navic)

# Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - to show icons
- Neovim 0.10+
- Git 2.43+
- [Nodeand and npm](https://timeweb.cloud/tutorials/nodejs/kak-ustanovit-node-js-v-ubuntu-22-04) - to use markdown-preview and install language servers and debug adapters with [mason.nvim.](https://github.com/williamboman/mason.nvim)
- [xclip](https://linuxconfig.org/how-to-use-xclip-on-linux) - to copy from neovim to main buffer
- [ripgerp](https://github.com/BurntSushi/ripgrep) - to search with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [cargo](https://github.com/rust-lang/cargo) - to replace something with [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [obsidian](https://help.obsidian.md/Getting+started/Download+and+install+Obsidian) - you need obsidian for note and change workspace dir in [obsidian-nvim.lua](https://github.com/aragami3070/nvim/blob/master/lua/plugins/obsidian-nvim.lua) (or remove obsidian.nvim plugin)
- [browser-sync](#web-tools) - to use veb tools

# My dirs settings

init.lua - to use all config from other plugins. 

In core/ I have:
- [plugins.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/plugins.lua) for write installation all plugins that I use
- [keymaps.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/keymaps.lua) for setup my keymaps
- [set.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/set.lua) for setup neovim options
- [colors.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/colors.lua) for setup my color theme

In plugins/ I have configs for installed plugins

<img src="forREADME/image/dirsSettings.png"/>

# Base plugins

Base plugin (I think so)

## Package manager

<details>
  <summary>Open</summary>

<strong>lua/core/plugins.lua:</strong>

```Lua
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
        -- installation your plugins
    },
    checker = { enabled = true },
})
```

<strong>init.lua</strong>

```Lua
require('core.plugins')
```

</details>

## neo-tree

<details>
  <summary>Open</summary>

<strong>lua/core/plugins.lua:</strong>

```Lua
    -- File explorer
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }
```

<strong>lua/plugins/neo-tree.lua</strong>

```Lua
vim.fn.sign_define("DiagnosticSignError",
{text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
{text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
{text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
{text = "󰌵", texthl = "DiagnosticSignHint"})

require("neo-tree").setup({
    position = "right",
    filesystem = {
        filtered_items = {
            visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
            hide_dotfiles = false,
            hide_gitignored = true,
        },
    }
})
```

<strong>init.lua</strong>

```Lua
require('plugins.neo-tree')
```

<strong>lua/core/keymaps.lua</strong>

```lua
-- NOTE: Added neo-tree short cut
vim.keymap.set("n", "<space>f", ":Neotree right<CR>", {desc = "Open Neotree Window"})
vim.keymap.set("n", "<space>r", ":Neotree close<CR>", {desc = "Close Neotree Window"})
vim.keymap.set("n", "<space>gs", ":Neotree git_status<CR>", {desc = "Open Neotree git_status Window"})
```

|    Vim Mode    |         Keymaps        |Description                                         |
| :------------: | :--------------------: | :------------------------------------------------: |
|     Normal     | '\<space>' + 'f'       | Open Neotree Window                                |
|     Normal     | '\<space>' + 'r'       | Close Neotree Window                               |
|     Normal     | '\<space>' + 'g' + 's' | Open Neotree git status Window                     |

</details>

## treesitter

<details>
  <summary>Open</summary>

<strong>lua/core/plugins.lua</strong>

```lua
    -- Syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

```

<strong>lua/plugins/treesitter.lua</strong>

```lua
require "nvim-treesitter.configs".setup {
    ensure_installed = {
        'cpp', 'c_sharp', 'kotlin',
        'svelte', 'lua', 'python',
        "markdown", "typst", "asm",
        "html", "css", "javascript",
        "typescript", "dockerfile",
        "bash", "json5", "cmake",
        "bibtex",},--, 'latex' },
    sync_install = false,
    highlight = {
        enable = true,
        -- HACK: latex work
        -- disable = { "latex", "markdown", "cls" },
        additional_vim_regex_highlighting = { "latex", "markdown", "cls" }
    },
    indent = { enable = true },
    auto_install = true,
    -- HACK: latex work
    ignore_install = { "latex"}, -- List of parsers to ignore installing
}
```

<strong>init.lua</strong>

```lua
require('plugins.treesitter')
```
</details>

## lsp cmp mason navic

<details>
  <summary>Open</summary>

These plugins are too interconnected to be divided into different sections

<strong>lua/core/plugins.lua</strong>

```lua
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

    -- Non-LSP actions and more
    {
        'nvimtools/none-ls.nvim',
    },

    -- LSP: Snippets
    {
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },

    -- LSP signature pop-up
    {'ray-x/lsp_signature.nvim'},

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

```
<strong>lua/plugins/mason.lua</strong>
```lua
require("mason").setup()

require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "omnisharp", "clangd", "texlab", "neocmake", "markdown_oxide", "ts_ls", "cssls", "html", "asm_lsp", "tinymist" },
}

```
<strong>lua/plugins/nvim-navic.lua</strong>

```lua
local navic = require('nvim-navic')

navic.setup {
    icons = {
        File = ' ',
        Module = ' ',
        Namespace = ' ',
        Package = ' ',
        Class = ' ',
        Method = ' ',
        Property = ' ',
        Field = ' ',
        Constructor = ' ',
        Enum = ' ',
        Interface = ' ',
        Function = ' ',
        Variable = ' ',
        Constant = ' ',
        String = ' ',
        Number = ' ',
        Boolean = ' ',
        Array = ' ',
        Object = ' ',
        Key = "󰌋 ",
        Null = '󰟢 ',
        EnumMember = ' ',
        Struct = ' ',
        Event = ' ',
        Operator = ' ',
        TypeParameter = ' '
    },
    lsp = {
        auto_attach = false,
        preference = nil,
    },
    highlight = true,
    separator = " > ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true,
    lazy_update_context = false,
    click = false,
    format_text = function(text)
        return text
    end,
}
navic.setup {
}

```

<strong>lua/plugins/lsp.lua</strong>

```lua
  local pid = vim.fn.getpid()

  local navic = require("nvim-navic")
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['clangd'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['omnisharp'].setup {
    capabilities = capabilities,
    cmd = { "/home/aragami3070/.local/share/nvim/mason/bin/omnisharp", "--languageserver" , "--hostPID", tostring(pid)},
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['texlab'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['neocmake'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['markdown_oxide'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['lua_ls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  -- js/typescript
  require('lspconfig')['ts_ls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['cssls'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['html'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['asm_lsp'].setup {
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end
  }

  require('lspconfig')['tinymist'].setup {
    on_init = function(client, initialization_result)
    if client.server_capabilities then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.semanticTokensProvider = false  -- turn off semantic tokens
    end
  end,
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
    end,
    handlers = nil,
  }
```

```lua
local cmp = require'cmp'
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        else
            fallback()
        end
      end, {"i","s"}),
     ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_prev_item()
        else
            fallback()
        end
      end, {"i","s"}),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'luasnip' }, -- For luasnip users.
      { name = 'nvim-cmp'},
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]-- 

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

```
<strong>init.lua</strong>

```lua
-- Added lsp plugin 
require('plugins.lsp')
-- Added plugin that auto downloading language server (code language)
require('plugins.mason')
-- Added plugin that auto compliting
require('plugins.cmp')
-- Added navic
require('plugins.nvim-navic')
```
</details>

## Markdown-preview
Need to run markdown-preview:

```
:Lazy build markdown-preview.nvim
```

## web-tools

need install to use html preview

```
npm install -g browser-sync
```

or if permision denied errors use sudo:

```
sudo npm install -g browser-sync
```

or this [Resolving EACCES permissions errors when installing packages globally](https://docs.npmjs.com/resolving-eacces-permissions-errors-when-installing-packages-globally)



