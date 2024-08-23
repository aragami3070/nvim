-- NOTE: Added leader button == space
vim.g.mapleader = " "


vim.api.nvim_set_keymap('n', '<space>o', ':Telescope find_files<CR>', { desc = "Find file by name", noremap = true, silent = true })

-- NOTE: if you want this grep, you need install ripgrep https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation

vim.api.nvim_set_keymap('n', '<space>l', ':Telescope live_grep<CR>', {desc = "Find file by text", silent = true })

-- NOTE: Added neo-tree short cut
vim.keymap.set("n", "<space>f", ":Neotree right<CR>", {desc = "Open Neotree Window"})
vim.keymap.set("n", "<space>r", ":Neotree close<CR>", {desc = "Close Neotree Window"})
vim.keymap.set("n", "<space>gs", ":Neotree git_status<CR>", {desc = "Open Neotree git_status Window"})

-- NOTE: Added move to window kelymaps <Ctrl> + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- NOTE: Added open git tree
vim.keymap.set("n", "<space>gt", ":Flog<CR>", { desc = "Open git tree" }) -- git tree

-- NOTE: Added new out from insert mode
vim.keymap.set('i', ':;', '<Esc>', { desc = "Out from i mode to n" })

-- NOTE: Added bufferline keymaps
vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { desc = "Open next file in bufferline" })
vim.keymap.set('n', '<s-Tab>', ':BufferLineCyclePrev<CR>', { desc = "Open prev file in bufferline" })
vim.keymap.set('n', '<space>x', ':BufferLinePickClose<CR>', { desc = "Close file from bufferline" })

-- NOTE: Added diffview keymaps
vim.keymap.set("n", "<space>go", ":DiffviewOpen<CR>", { desc = "Open diffview with last commit" })
vim.keymap.set("n", "<space>gc", ":DiffviewClose<CR>", { desc = "Close diffview" })
vim.keymap.set("n", "<space>gh", ":DiffviewFileHistory<CR>", { desc = "Open file commit history" })

-- NOTE: Added dap for c++
-- TODO: add dap for kotlin
-- TODO: add dap for c#

-- NOTE: Added dap keymaps
vim.keymap.set("n", "<space>db", ":DapToggleBreakpoint<CR>", { desc = "Do break point" }) -- add|delete breakpoint on line 
vim.keymap.set("n", "<space>dc", ":DapContinue<CR>", { desc = "Start connect to debug" }) -- даёт выбор: 1) запустить debug файл или 2)подключиться к процессу. Я тестил первый вариант, работает хорошо, второй не пробовал, хз как оно работет 
-- NOTE:
-- Как использовать первый вариант DapContinue на примере c++: 
-- 1)создаем debug файл: 
-- g++ --debug test.cpp test 
-- 2)заходим в nvim ставим breakpoint-ы через Space + d + b 
-- 3)запускаем debug файл, созданный выше
-- нажимаем Space + d + c 
-- открывается меню выбора: 1) запустить debug файл или 2)подключиться к процессу.
-- вводим 1 в command line 
-- потом нужно прописать название debug файла (там автоматически прописывается путь до открытой директории)
-- после этого, если никаких ошибок не допущено, то откроится dap ui и начнется процесс дебага, аля vscode 

-- NOTE: те keymap, которые не тестил закоментированы

-- vim.keymap.set("n", "<space>da", function() require("dap").continue({ before = get_args }) end) -- "Run with Args" 
-- vim.keymap.set("n","<leader>dC", function() require("dap").run_to_cursor() end)  -- "Run to Cursor"
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end, {desc = "DAP step into"})  -- "Step Into" 
-- vim.keymap.set("n", "<leader>dj", function() require("dap").down() end)  -- "Down" 
-- vim.keymap.set("n", "<leader>dk", function() require("dap").up() end)  -- "Up" 
-- vim.keymap.set("n", "<leader>dg", function() require("dap").goto_() end)  -- "Go to Line (No Execute)" 
-- vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end)  -- "Run Last" 
vim.keymap.set("n", "<leader>do", function() require("dap").step_out() end, {desc = "DAP step out"})  -- "Step Out" 
vim.keymap.set("n", "<leader>dO", function() require("dap").step_over() end, {desc = "DAP step over"})  -- Step Over" 
-- vim.keymap.set("n", "<leader>dp", function() require("dap").pause() end)  -- "Pause" 
-- vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end)  -- "Toggle REPL" 
-- vim.keymap.set("n", "<leader>ds", function() require("dap").session() end)  -- "Session" 
-- vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end)  -- "Terminate" 


-- NOTE: Added dap ui keymaps
vim.keymap.set("n", "<space>du", function() require("dapui").toggle({ }) end, { desc = "DAP UI open"}) -- open|close Dap UI
-- vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end) -- хз что делает, но там откуда брал код оно было
-- vim.keymap.set("n", "<leader>dw", function() require("dap.ui.widgets").hover() end)  -- "Widgets" 


