-- NOTE: Added leader button == space
vim.g.mapleader = " "

-- NOTE: Added Telescope keymaps
vim.api.nvim_set_keymap('n', '<space>lf', ':Telescope find_files<CR>', { desc = "Find file by name", noremap = true, silent = true })
-- NOTE: if you want this grep, you need install ripgrep https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation
vim.api.nvim_set_keymap('n', '<space>lg', ':Telescope live_grep<CR>', {desc = "Find file by text", silent = true })
vim.api.nvim_set_keymap('n', '<space>ls', ':Telescope lsp_dynamic_workspace_symbols<CR>', {desc = "Find class/method/field", silent = true })
vim.api.nvim_set_keymap('n', '<space>gb', ':Telescope git_branches<CR>', {desc = "Choose git branhe", silent = true })





-- NOTE: Added neo-tree short cut
vim.keymap.set("n", "<space>f", ":Neotree right<CR>", {desc = "Open Neotree Window"})
vim.keymap.set("n", "<space>r", ":Neotree close<CR>", {desc = "Close Neotree Window"})
vim.keymap.set("n", "<space>gs", ":Neotree git_status<CR>", {desc = "Open Neotree git_status Window"})
vim.keymap.set("n", "<space>gds",function() require("neo-tree.command").execute({ source = "document_symbols", position = "right", dir = vim.uv.cwd() }) end, {desc = "Open Neotree symbols Window"})




-- NOTE: Added move to window kelymaps <Ctrl> + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })





-- NOTE: Added rename keymaps
vim.keymap.set("n", "<space>nw", ":IncRename ", { desc = "Rename this"})





-- NOTE: Added spectre (rename) keymaps
vim.keymap.set('n', '<leader>so', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})





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





-- NOTE: Added Noice Last/History message
vim.keymap.set("n", "<space>.l", ":NoiceLast<CR>", { desc = "Noice Last message" })
vim.keymap.set("n", "<space>.h", ":NoiceHistory<CR>", { desc = "Noice History message" })





-- NOTE: Added pomo (timer) keymaps
vim.keymap.set("n", "<space>tse", ":TimerSession<CR>", { desc = "Start Timer Session" })
vim.keymap.set("n", "<space>tsta", ":TimerStart", { desc = "Timer Start (choose time)" })
vim.keymap.set("n", "<space>tp", ":TimerPause<CR>", { desc = "Timer Pause" })
vim.keymap.set("n", "<space>tc", ":TimerResume<CR>", { desc = "Timer Continue" })
vim.keymap.set("n", "<space>tsh", ":TimerShow<CR>", { desc = "Timer Show" })
vim.keymap.set("n", "<space>tsto", ":TimerStop<CR>", { desc = "Timer Stop" })
vim.keymap.set("n", "<space>th", ":TimerHide<CR>", { desc = "Timer Hide" })





-- NOTE: Added obsidian  keymaps
vim.keymap.set("n", "<space>oo", ":ObsidianOpen<CR>", { desc = "Open a note in the Obsidian app" })
vim.keymap.set("n", "<space>ote", ":ObsidianTemplates<CR>", { desc = "Choose Template" })
vim.keymap.set("n", "<space>otod", ":ObsidianToday<CR>", { desc = "Open today note" })
vim.keymap.set("n", "<space>oton", ":ObsidianToday +", { desc = "Open today+ note" })
vim.keymap.set("n", "<space>otom", ":ObsidianTomorrow<CR>", { desc = "Open tomorrow note" })
vim.keymap.set("n", "<space>oye", ":ObsidianYesterday<CR>", { desc = "Open yesterday note" })





-- NOTE: Added CMakeDebug start
vim.keymap.set("n", "<space>dsc", ":CMakeDebug<CR>", { desc = "Start CMake debug"})





-- NOTE: Added trouble kemaps
vim.keymap.set("n", "<space>zd", ":Trouble diagnostics toggle focus=true<cr>", { desc = "Diagnostics (Trouble)"})
vim.keymap.set("n", "<space>zbd", ":Trouble diagnostics toggle filter.buf=0 focus=true<cr>", { desc = "Buffer Diagnostics (Trouble)"})
vim.keymap.set("n", "<space>zs", ":Trouble symbols toggle focus=true<cr>", { desc = "Symbols (Trouble)"})
-- vim.keymap.set("n", "<space>zls", ":Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions/references/... (Trouble)"})
-- vim.keymap.set("n", "<space>zll", ":Trouble loclist toggle<cr>", { desc = "Location List (Trouble)"})
-- vim.keymap.set("n", "<space>zq", ":Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)"})





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


