-- Var for escape form insert mode in macros
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)

-- Check .cs FileType
vim.api.nvim_create_autocmd("FileType", {
	-- Set needed FileType
	pattern = "cs",
	-- If FileType type .cs do:
	callback = function()
		-- Write all macros for csharp projects
		vim.fn.setreg("a", 'yoConsole.WriteLine($"'.. esc ..'pa:{'.. esc ..'pa}");'.. esc ..' ')
	end,
})
