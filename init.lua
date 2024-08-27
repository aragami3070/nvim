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

-- Added git plugins 
require('plugins.gitsigns')
require('plugins.diffview')

require('plugins.nvim-dap-c++')
require('plugins.nvim-dap-c#')
require('plugins.nvim-dap-ui')
