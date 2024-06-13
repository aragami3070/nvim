vim.opt.termguicolors = true


--vim.cmd.colorscheme("kanagawa-wave")

vim.cmd.colorscheme('one-nvim')
-- Comments next line if you generate config for Kitty
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
     -- hue_1         = {"#56b6c2", 247, "hue_1"}   -- hsl(187, 47%, 55%);
     -- hue_2         = {"#61afef",  75, "hue_2"}   -- hsl(207, 82%, 66%);
     -- hue_3         = {"#c678dd", 176, "hue_3"}   -- hsl(286, 60%, 67%);
     -- hue_4         = {"#98c379", 114, "hue_4"}   -- hsl( 95, 38%, 62%);
     -- hue_5         = {"#e06c75", 168, "hue_5"}   -- hsl(355, 65%, 65%);
     -- hue_5_2       = {"#be5046", 131, "hue_5_2"} -- hsl(  5, 48%, 51%);
     -- hue_6         = {"#d19a66", 247, "hue_6"}   -- hsl( 29, 54%, 61%);
     -- hue_6_2       = {"#e5c07b", 180, "hue_6_2"} -- hsl( 39, 67%, 69%);

-- NOTE:(nrydanov) Temporary treesitter fix
vim.api.nvim_set_hl(0, "@variable", { fg = "#e5c07b" })
