require("hlchunk").setup({
	chunk = {
        enable = true,
        use_treesitter = true,
		style = {
			-- { fg = "#E0B0FF" },
			{ fg = "#636d83" },
		},
        chars = {
			horizontal_line = "─",
			vertical_line = "│",
			left_top = "╭",
			left_bottom = "╰",
			right_arrow = "─",
        },
		error_sign = true,
    -- animation related
		duration = 20,
		delay = 30,

    },
    blank = {
		enable = false,
	},
    line_num = {
		enable = false,
		use_treesitter = true,
    },
})
