-- Added leader button == space
vim.g.mapleader = " "

require("core.plugins")
require("core.set")
require("core.colors")
require("core.keymaps")

--Plugins

--Added plugin that add corect
require("plugins.treesitter")
--Added plugin that tree dirs/files
require("plugins.neo-tree")
--Added plugin that find file by name
require("plugins.telescope")
--Added plugin
require("plugins.nvim-autopairs")
--Added lsp plugin
require("plugins.lsp")
--Added plugin that auto downloading language server (code language)
require("plugins.mason")
--Added plugin that auto compliting
require("plugins.cmp")
require("plugins.roslyn")
require("plugins.supermaven-nvim")
require("plugins.flash")
-- Added plugin that add lualine in nvim
require("plugins.lualine")
-- Added plugin that add bufferline in nvim
require("plugins.bufferline")

-- Added plugin that highlighting hex color
require("plugins.colorizer")
-- #60f
-- Added plugin that open terminal in nvim
require("plugins.toggleterm")
-- TODO: do todo com
-- FIX: do fix com
-- WARNING: do warning com
-- NOTE: do note com
-- HACK: do hack com
-- PERF: do perf com
require("plugins.todo-comments")

-- Added nvim-surround
require("plugins.nvim-surround")

require("plugins.dashboard-nvim")

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
require("plugins.gitsigns")
require("plugins.diffview")

-- Added obsidian.nivm
require("plugins.obsidian-nvim")

-- Added indent highlighting
require("plugins.hlchunk-nvim")

-- Added Noice config
require("plugins.noice")

-- Added web preview
require("plugins.web-tools-nvim")

-- Added navic
require("plugins.nvim-navic")

-- Added tiny-inline-diagnostic
require("plugins.tiny-inline-diagnostic")

-- Added nvim-scissors (custom snippets)
require("plugins.nvim-scissors")

-- Added nvim-dap
require("plugins.nvim-dap-c++")
require("plugins.nvim-dap-c#")
require("plugins.nvim-dap-rust")

vim.g.Illuminate_useDeprecated = 1
require("plugins.instant-nvim")
require("plugins.livecode")

require("plugins.ts-comments-nvim")
require("plugins.formatting")
require("plugins.nvim-devdocs")

require("macros.csharp-macros")
-- Add not working because all api not working in my country and deepseek don't have free api now
-- require('plugins.mcphub')
