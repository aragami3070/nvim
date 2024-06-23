vim.opt.termguicolors = true


--vim.cmd.colorscheme("kanagawa-wave")

vim.cmd.colorscheme('one-nvim')
-- Comments next line if you generate config for Kitty
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

-- NOTE:(nrydanov) Temporary treesitter fix
vim.api.nvim_set_hl(0, "@variable", { fg = "#98c379" })
