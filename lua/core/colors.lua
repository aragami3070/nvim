vim.opt.termguicolors = true

vim.cmd.colorscheme('one-nvim')
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })

-- NOTE:(nrydanov) Temporary treesitter fix
vim.api.nvim_set_hl(0, "@variable", { fg = "#98c379" })

-- HACK: fix dap colors

-- Red
vim.api.nvim_set_hl(0, "DapUIStop", { default = true, link = "WarningMsg", force = true })
vim.api.nvim_set_hl(0, "DapUIStopNC", { default = true, link = "WarningMsg", force = true })
-- Blue
vim.api.nvim_set_hl(0, "DapUIStepOutNC", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepBackNC", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepIntoNC", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepOverNC", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepOut", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepBack", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepInto", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepOver", { default = true, link = "Include", force = true })
-- Green
vim.api.nvim_set_hl(0, "DapUIRestart", { default = true, link = "Constant", force = true })
vim.api.nvim_set_hl(0, "DapUIPlayPause", { default = true, link = "Constant", force = true })
vim.api.nvim_set_hl(0, "DapUIRestartNC", { default = true, link = "Constant", force = true })
vim.api.nvim_set_hl(0, "DapUIPlayPauseNC", { default = true, link = "Constant", force = true })

-- #98c379
vim.api.nvim_set_hl(0, "DapUIVariable", { default = true, link = "@variable", force = true })

-- Violet
vim.api.nvim_set_hl(0, "DapUIValue", { default = true, link = "boolean", force = true })
vim.api.nvim_set_hl(0, "NvimDapVirtualTextChanged", { default = true, link = "boolean", force = true })

