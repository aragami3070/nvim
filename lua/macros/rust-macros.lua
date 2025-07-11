-- Var for escape form insert mode in macros
local esc = vim.api.nvim_replace_termcodes("<Esc>", true, true, true)
local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)

-- Check .rs FileType
vim.api.nvim_create_autocmd("FileType", {
	-- Set needed FileType
	pattern = "rust",
	-- If FileType type .rs do:
	callback = function()
		-- Write all macros for rust projects
		vim.fn.setreg("a", "y/;" .. enter .. 'oprintln!("' .. esc .. "pa: {" .. esc .. 'pa}");' .. esc .. " ")
	end,
})
