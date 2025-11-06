local enter = vim.api.nvim_replace_termcodes("<CR>", true, true, true)
local cr = vim.api.nvim_replace_termcodes("<C-R>", true, true, true)
local ca = vim.api.nvim_replace_termcodes("<C-A>", true, true, true)


-- Check .typ FileType
vim.api.nvim_create_autocmd("FileType", {
	-- Set needed FileType
	pattern = "typ",
	-- If FileType type .typ do:
	callback = function()
		-- Write all macros for typst projects
		vim.fn.setreg("c", "'oma/^=\\s\\([^_]*[а-яА-ЯёЁ]\\)" .. enter
			.. "mo't0v$hy:e questions/" .. cr .. "+.typ" .. enter
			.. ':w' .. enter .. ":e main.typ" .. enter .. "'aV'ok"
			.. 'yy:e questions/' .. cr .. "+.typ" .. enter
			.. '"ypkJ:w' .. enter .. ":e main.typ" .. enter
			.. "'tv$h" .. ca .. ":w" .. enter .. " ")
	end,
})

