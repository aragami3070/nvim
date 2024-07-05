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

-- Added dap for c++
-- TODO: add dap for kotlin
-- TODO: add dap for c#

-- Added dap keymaps
vim.keymap.set("n", "<space>db", ":DapToggleBreakpoint<CR>") -- add|delete breakpoint on line 
vim.keymap.set("n", "<space>dc", ":DapContinue<CR>") -- даёт выбор: 1) запустить debug файл или 2)подключиться к процессу. Я тестил первый вариант, работает хорошо, второй не пробовал, хз как оно работет 
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
vim.keymap.set("n", "<leader>di", function() require("dap").step_into() end)  -- "Step Into" 
-- vim.keymap.set("n", "<leader>dj", function() require("dap").down() end)  -- "Down" 
-- vim.keymap.set("n", "<leader>dk", function() require("dap").up() end)  -- "Up" 
-- vim.keymap.set("n", "<leader>dg", function() require("dap").goto_() end)  -- "Go to Line (No Execute)" 
-- vim.keymap.set("n", "<leader>dl", function() require("dap").run_last() end)  -- "Run Last" 
vim.keymap.set("n", "<leader>do", function() require("dap").step_out() end)  -- "Step Out" 
vim.keymap.set("n", "<leader>dO", function() require("dap").step_over() end)  -- Step Over" 
-- vim.keymap.set("n", "<leader>dp", function() require("dap").pause() end)  -- "Pause" 
-- vim.keymap.set("n", "<leader>dr", function() require("dap").repl.toggle() end)  -- "Toggle REPL" 
-- vim.keymap.set("n", "<leader>ds", function() require("dap").session() end)  -- "Session" 
-- vim.keymap.set("n", "<leader>dt", function() require("dap").terminate() end)  -- "Terminate" 


-- Added dap ui keymaps
vim.keymap.set("n", "<space>du", function() require("dapui").toggle({ }) end) -- open|close Dap UI
-- vim.keymap.set("n", "<leader>de", function() require("dapui").eval() end) -- хз что делает, но там откуда брал код оно было
-- vim.keymap.set("n", "<leader>dw", function() require("dap.ui.widgets").hover() end)  -- "Widgets" 


