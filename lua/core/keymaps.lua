
vim.api.nvim_set_keymap('n', '<space>o', ':Telescope find_files<CR>', { noremap = true, silent = true })

--Added neo-tree short cut
vim.keymap.set("n", "<space>d", ":Neotree right<CR>") -- toggle file explorer
vim.keymap.set("n", "<space>r", ":Neotree close<CR>") -- toggle file explorer
vim.keymap.set("n", "<space>gs", ":Neotree git_status<CR>") -- toggle file explorer

vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })


vim.keymap.set("n", "<space>gt", ":Flog<CR>") -- git tree

--Added new out from insert mode
vim.keymap.set('i', ':;', '<Esc>')
