-- Added leader button == space
vim.g.mapleader = " "

require('core.plugins')
require('core.set')
require('core.colors')
require('core.keymaps')

--Plugins

--Added plugin that add corect 
require('plugins.treesitter')
--Added plugin that tree dirs/files
require('plugins.neo-tree')
--Added plugin that find file by name
require('plugins.telescope')
--Added plugin
require('plugins.nvim-autopairs')
--Added lsp plugin 
require('plugins.lsp')
--Added plugin that auto downloading language server (code language)
require('plugins.mason')
--Added plugin that auto compliting
require('plugins.cmp')
-- Added plugin that comment|uncomment lines by space+c
require('plugins.nvim-comment')
-- Added plugin that add lualine in nvim
require('plugins.lualine')
-- Added plugin that add bufferline in nvim
require('plugins.bufferline')

-- Added plugin that highlighting hex color
require('plugins.colorizer')
-- #60f
-- Added plugin that open terminal in nvim
require('plugins.toggleterm')
-- TODO: do todo com 
-- FIX: do fix com 
-- WARNING: do warning com
-- NOTE: do note com
-- HACK: do hack com
-- PERF: do perf com 
require('plugins.todo-comments')

-- Added nvim-surround
require("plugins.nvim-surround")

require('plugins.dashboard-nvim')

-- Added nvim-scrollbar plagin
require("plugins.nvim-scrollbar")

-- Added CMake highlighting
require("plugins.CMake")

-- Added rename plugin
require("plugins.inc-rename")

-- Added pomo plugin (timer)
require("plugins.pomo-nvim")

-- Added notify
require("plugins.notify")

-- Added git plugins 
require('plugins.gitsigns')
require('plugins.diffview')

-- Added obsidian.nivm
require("plugins.obsidian-nvim")

-- Added indent highlighting
require("plugins.hlchunk-nvim")

-- Added web preview
require('plugins.web-tools-nvim')
vim.lsp.set_log_level("debug")
-- Added nvim-dap
require('plugins.nvim-dap-c++')
require('plugins.nvim-dap-c#')
require('plugins.nvim-dap-ui')
