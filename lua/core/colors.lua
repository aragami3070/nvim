vim.opt.termguicolors = true


--vim.cmd.colorscheme("kanagawa-wave")

vim.cmd.colorscheme('one-nvim')
-- Comments next line if you generate config for Kitty
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
vim.api.nvim_set_hl(0, "DapUIStepOut", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepBack", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepInto", { default = true, link = "Include", force = true })
vim.api.nvim_set_hl(0, "DapUIStepOver", { default = true, link = "Include", force = true })

-- Green


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
-- DapUIPlayPause xxx links to Repeat
-- DapUIRestart   xxx links to Repeat
-- DapUIUnavailable xxx links to Comment
-- DapUIWinSelect xxx links to Special
-- DapUIEndofBuffer xxx links to EndOfBuffer
-- DapUINormalNC  xxx guibg=#07080d
--                    links to Normal
-- DapUIPlayPauseNC xxx guibg=#07080d
--                    links to Repeat
-- DapUIRestartNC xxx guibg=#07080d
--                    links to Repeat
-- DapUIUnavailableNC xxx guibg=#07080d
--                    links to Comment
-- DapUIStepOverNC xxx guibg=#07080d
--                    links to Label
-- DapUIStepIntoNC xxx guibg=#07080d
--                    links to Label
-- DapUIStepBackNC xxx guibg=#07080d
--                    links to Label
-- DapUIStepOutNC xxx guibg=#07080d
--                    links to Label
-- DapStoppedLine xxx links to Visual
