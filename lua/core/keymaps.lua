-- Added leader button == space
vim.g.mapleader = " "


vim.api.nvim_set_keymap('n', '<space>o', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- NOTE: if you want this grep, you need install ripgrep https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation

vim.api.nvim_set_keymap('n', '<space>l', ':Telescope live_grep<CR>', {silent = true })

--Added neo-tree short cut
vim.keymap.set("n", "<space>f", ":Neotree right<CR>")
vim.keymap.set("n", "<space>r", ":Neotree close<CR>")
vim.keymap.set("n", "<space>gs", ":Neotree git_status<CR>")

-- Added open git tree
vim.keymap.set("n", "<space>gt", ":Flog<CR>") -- git tree

--Added new out from insert mode
vim.keymap.set('i', ':;', '<Esc>')

-- Added bufferline keymaps
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>')
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>')
vim.keymap.set('n', '<space>x', ':BufferLinePickClose<CR>')

-- Added diffview keymaps

vim.keymap.set("n", "<space>go", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<space>gc", ":DiffviewClose<CR>")
vim.keymap.set("n", "<space>gh", ":DiffviewFileHistory<CR>")

-- TODO: add dap for c++
-- TODO: add dap for kotlin
-- TODO: add dap for c#

-- Added dap keymaps
-- vim.keymap.set("n", "<space>db", ":DapToggleBreakpoint<CR>")
-- vim.keymap.set("n", "<space>dc", ":DapContinue<CR>")

