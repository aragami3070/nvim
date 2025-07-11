# My neovim config README シ 

(WORK IN PROGRESS 👀)

# Table of Contents

- [Requirements](#Requirements)
- [My dirs settings](#My-dirs-settings)
- [Base plugins](#Base-plugins)

# Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - to show icons
- Neovim 0.10+
- Git 2.43+
- [Node and npm](https://timeweb.cloud/tutorials/nodejs/kak-ustanovit-node-js-v-ubuntu-22-04) - to use markdown-preview and install language servers and debug adapters with [mason.nvim.](https://github.com/williamboman/mason.nvim)
- [xclip](https://linuxconfig.org/how-to-use-xclip-on-linux) - to copy from neovim to main buffer
- [ripgerp](https://github.com/BurntSushi/ripgrep) - to search with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [cargo](https://github.com/rust-lang/cargo) - to replace something with [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [obsidian](https://help.obsidian.md/Getting+started/Download+and+install+Obsidian) - you need obsidian for note and change workspace dir in [obsidian-nvim.lua](https://github.com/aragami3070/nvim/blob/master/lua/plugins/obsidian-nvim.lua) (or remove obsidian.nvim plugin)

# My dirs settings

init.lua - to use all config from other plugins. 

In core/ I have:
- [plugins.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/plugins.lua) for write installation all plugins that I use
- [keymaps.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/keymaps.lua) for setup my keymaps
- [set.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/set.lua) for setup neovim options
- [colors.lua](https://github.com/aragami3070/nvim/blob/master/lua/core/colors.lua) for setup my color theme

In plugins/ I have configs for installed plugins

In macros/ I have macros for some languages

# Base plugins

Base plugin (I think so)

- Package manager - [lazy.nvim](https://github.com/folke/lazy.nvim)
- neo-tree - [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
- treesitter - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- lsp - [lspconfig](https://github.com/neovim/nvim-lspconfig)
- cmp - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- mason - [mason.nvim](https://github.com/williamboman/mason.nvim)
- navic - [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- telescope - [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- nvim-spectre - [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- nvim-autopairs - [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- which-key.nvim - [which-key.nvim](https://github.com/folke/which-key.nvim)
- bufferline.nvim - [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)


# Other plugins

- Markdown-preview - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
	Need to run markdown-preview:
	```
		:Lazy build markdown-preview.nvim
	```
- obsidian - [obsidian-nvim](https://github.com/epwalsh/obsidian-nvim)
