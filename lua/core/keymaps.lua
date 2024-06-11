
vim.api.nvim_set_keymap('n', '<space>o', ':Telescope find_files<CR>', { noremap = true, silent = true })

--Added neo-tree short cut
vim.keymap.set("n", "<space>d", ":Neotree<CR>") -- toggle file explorer
vim.keymap.set("n", "<space>r", ":Neotree close<CR>") -- toggle file explorer
vim.keymap.set("n", "<space>g", ":Neotree git_status<CR>") -- toggle file explorer

