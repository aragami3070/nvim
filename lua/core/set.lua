--Added lines number with relative
vim.opt.number = true
vim.opt.relativenumber = true

--Added cursorline
vim.opt.cursorline = true

--Added column on 80
vim.opt.colorcolumn = "80"

-- expand tab like 4 spaces
vim.opt.expandtab = true

vim.opt.undofile = true
vim.opt.spelllang = { "en", "ru" }

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
vim.opt.clipboard = "unnamedplus"


-- Autocmds to toggle relative numbers when entering/leaving Insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function() vim.opt.relativenumber = false end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function() vim.opt.relativenumber = true end,
})

-- Automatically remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Added space = '·', tab = '·'
vim.opt.listchars = { space = "·", tab = "··" }
vim.opt.list = true

vim.notify = require("mini")
vim.lsp.set_log_level("off")
vim.opt.conceallevel = 1
vim.diagnostic.config({ virtual_text = false })

vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
