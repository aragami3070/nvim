vim.opt.termguicolors = true
local set = vim.api.nvim_set_hl

vim.cmd.colorscheme("one-nvim")
local function fix_colors()
    set(0, "Normal", { bg = "none" })
    set(0, "NormalFloat", { bg = "none" })
    set(0, "SignColumn", { bg = "none" })
    set(0, "TabLineFill", { bg = "none" })

    -- NOTE:(nrydanov) Temporary treesitter fix
    set(0, "@variable", { fg = "#98c379" })

    -- links to StorageClass

    -- HACK: fix dap colors

    -- Red
    set(0, "DapUIStop", { default = false, link = "WarningMsg", force = true })
    set(0, "DapUIStopNC", { default = false, link = "WarningMsg", force = true })
    -- Blue
    set(0, "DapUIStepOutNC", { default = false, link = "Include", force = true })
    set(0, "DapUIStepBackNC", { default = false, link = "Include", force = true })
    set(0, "DapUIStepIntoNC", { default = false, link = "Include", force = true })
    set(0, "DapUIStepOverNC", { default = false, link = "Include", force = true })
    set(0, "DapUIStepOut", { default = false, link = "Include", force = true })
    set(0, "DapUIStepBack", { default = false, link = "Include", force = true })
    set(0, "DapUIStepInto", { default = false, link = "Include", force = true })
    set(0, "DapUIStepOver", { default = false, link = "Include", force = true })
    -- Green
    set(0, "DapUIRestart", { default = false, link = "Constant", force = true })
    set(0, "DapUIPlayPause", { default = false, link = "Constant", force = true })
    set(0, "DapUIRestartNC", { default = false, link = "Constant", force = true })
    set(0, "DapUIPlayPauseNC", { default = false, link = "Constant", force = true })

    -- #98c379
    set(0, "DapUIVariable", { default = false, link = "@variable", force = true })

    -- Violet
    set(0, "DapUIValue", { default = false, link = "boolean", force = true })
    set(0, "NvimDapVirtualTextChanged", { default = false, link = "boolean", force = true })
end

fix_colors()
