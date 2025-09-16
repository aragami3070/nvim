-- Var for escape form insert mode in macros
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

-- Check .cpp FileType
vim.api.nvim_create_autocmd("FileType", {
	-- Set needed FileType
	pattern = "cpp",
	-- If FileType type .cpp do:
	callback = function()
		-- Write all macros for cpp projects
		vim.fn.setreg("a", "y/;" .. enter .. 'ostd::cout << "' .. esc .. 'pa: " << ' .. esc .. 'pa << std::endl;' .. esc .. " ")
	end,
})
