--Basic 

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
require('plugins.nvim-comment')
require('plugins.gitsigns')
require('plugins.lualine')

--local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
--parser_config.latex = {
  --install_info = {
    --url = "~.local/state/nvim/tree-sitter-latex", -- local path or git repo
    --files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    --branch = "main", -- default branch in case of git repo if different from master
    --generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    --requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  --},
  --filetype = "tex", -- if filetype does not match the parser name
--}
