# My neovim config README シ

(WORK IN PROGRESS 👀)

# Requirements

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - to show icons
- Neovim 0.10+
- Git 2.43+
- [Node and npm](https://timeweb.cloud/tutorials/nodejs/kak-ustanovit-node-js-v-ubuntu-22-04) - to use markdown-preview and install language servers and debug adapters with [mason.nvim.](https://github.com/williamboman/mason.nvim)
- [xclip](https://linuxconfig.org/how-to-use-xclip-on-linux) - to copy from neovim to main buffer
- [ripgerp](https://github.com/BurntSushi/ripgrep) - to search with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [cargo](https://github.com/rust-lang/cargo) - to replace something with [nvim-spectre](https://github.com/nvim-pack/nvim-spectre)
- [obsidian](https://help.obsidian.md/Getting+started/Download+and+install+Obsidian) - you need obsidian for note and change workspace dir in [obsidian-nvim.lua](https://github.com/aragami3070/nvim/blob/master/lua/plugins/obsidian-nvim.lua) (or remove obsidian.nvim plugin)


- Markdown-preview - [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
	Need to run markdown-preview:
	```
		:Lazy build markdown-preview.nvim
	```
