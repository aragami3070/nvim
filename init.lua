-- Add leader button == space
vim.g.mapleader = " "

require("core.lazy-install")
require("core.set")
require("core.colors")
require("core.keymaps")

-- Plugins
-- Add corect highlighting
require("plugins.treesitter")
-- Add tree dirs/files
require("plugins.neo-tree")
-- Add find file by name
require("plugins.telescope")
-- Add plugin
require("plugins.nvim-autopairs")
-- Add lsp plugin
require("plugins.lsp")
-- Add auto downloading language server (code language)
require("plugins.mason")
-- Add auto compliting
require("plugins.cmp")
require("plugins.roslyn")
require("plugins.crates-nvim")
require("plugins.flash")
-- Add lualine in nvim
require("plugins.lualine")
-- Add bufferline in nvim
require("plugins.bufferline")

-- Add highlighting hex color
require("plugins.colorizer")
-- #60f
--  Add open terminal in nvim
require("plugins.toggleterm")

require("plugins.todo-comments")
require("plugins.ts-comments-nvim")

-- Add nvim-surround
require("plugins.nvim-surround")

-- Add pomo plugin (timer)
require("plugins.pomo-nvim")

-- Add git plugins
require("plugins.gitsigns")
require("plugins.diffview")

-- Add obsidian.nivm
require("plugins.obsidian-nvim")

-- Add indent highlighting
require("plugins.hlchunk-nvim")

-- Add Noice config
require("plugins.noice")

-- Add tiny-inline-diagnostic
require("plugins.tiny-inline-diagnostic")

-- Add nvim-scissors (custom snippets)
require("plugins.nvim-scissors")

require("plugins.formatting")
require("plugins.venn")

-- Add nvim-dap configs
require("plugins.nvim-dap-c++")
require("plugins.nvim-dap-c#")
require("plugins.nvim-dap-rust")

vim.g.Illuminate_useDeprecated = 1

require("macros.rust-macros")
require("macros.csharp-macros")
require("macros.cpp-macros")
require("macros.typst-macros")
