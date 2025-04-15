vim.opt.termguicolors = true


--vim.cmd.colorscheme("kanagawa-wave")

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



-- NvimDapVirtualText xxx links to Comment
-- NvimDapVirtualTextChanged xxx links to DiagnosticVirtualTextWarn
-- NvimDapVirtualTextError xxx links to DiagnosticVirtualTextError
-- NvimDapVirtualTextInfo xxx links to DiagnosticVirtualTextInfo
-- DapUINormal    xxx links to Normal
-- DapUIVariable  xxx links to Normal
-- DapUIScope     xxx links to Identifier
-- DapUIType      xxx links to Type
-- DapUIValue     xxx links to Normal
-- DapUIModifiedValue xxx links to Function
-- DapUIDecoration xxx links to Identifier
-- DapUIThread    xxx links to Identifier
-- DapUIStoppedThread xxx links to Function
-- DapUIFrameName xxx links to Normal
-- DapUISource    xxx links to Define
-- DapUILineNumber xxx links to LineNr
-- DapUIFloatNormal xxx links to NormalFloat
-- DapUIFloatBorder xxx links to Identifier
-- DapUIWatchesEmpty xxx links to PreProc
-- DapUIWatchesValue xxx links to Statement
-- DapUIWatchesError xxx links to PreProc
-- DapUIBreakpointsPath xxx links to Identifier
-- DapUIBreakpointsInfo xxx links to Statement
-- DapUIBreakpointsCurrentLine xxx links to CursorLineNr
-- DapUIBreakpointsLine xxx links to DapUILineNumber
-- DapUIBreakpointsDisabledLine xxx links to Comment
-- DapUICurrentFrameName xxx links to DapUIBreakpointsCurrentLine
-- DapUIUnavailable xxx links to Comment
-- DapUIWinSelect xxx links to Special
-- DapUIEndofBuffer xxx links to EndOfBuffer
-- DapUINormalNC  xxx guibg=#07080d
--                    links to Normal
-- DapUIUnavailableNC xxx guibg=#07080d
--                    links to Comment
-- DapStoppedLine xxx links to Visual
