--Added lines number with relative
vim.opt.number = true
vim.opt.relativenumber = true

--Added cursorline
vim.opt.cursorline = true

--Added column on 80 and 120 symbol	
vim.opt.colorcolumn = "80,120"

--don't understande but added
vim.opt.undofile = true
vim.opt.spelllang = {"en", "ru"}
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true

vim.opt.showmatch = true
vim.opt.mat = 2
vim.opt.syntax = "on"
vim.opt.pumheight = 5

vim.opt.background = "dark"


--Added one column before numbers
vim.opt.signcolumn = "yes"
--Added menu Ctrl + n
vim.opt.completeopt = "menuone"

--Added tabs = 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.inccommand = "split"
--Added copy in main buffer
vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.cmd('autocmd VimLeave * :set guicursor=a:ver25-blinkon10')

--Added norelateve number in insert mode
vim.cmd('autocmd InsertEnter * :set norelativenumber')
vim.cmd('autocmd InsertLeave * :set relativenumber')

-- Added space = '·', tab = '| '
vim.opt.listchars = { space = '·', tab = '| '}
vim.opt.list = true

vim.notify = require("notify")

vim.opt.conceallevel = 1
