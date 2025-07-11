-- stylua: ignore
local colors = {
  green = '#98FF79',
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#000000',
  white  = '#d6d6d6',
  red    = '#ff5189',
  violet = '#d183e8',
  violet2 = '#BB00DF',
  grey   = '#303030',
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white },
	},

	insert = { a = { fg = colors.black, bg = colors.green } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.violet2 } },
	terminal = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.black },
		b = { fg = colors.white, bg = colors.black },
		c = { fg = colors.white, bg = colors.black },
		x = { fg = colors.white, bg = colors.black },
	},
}
require("lualine").setup({
	options = {
		theme = bubbles_theme,
		component_separators = " | ",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = { { "mode", separator = { left = "", right = ""  }, right_padding = 1 } },
		lualine_x = {
			function()
				local ok, pomo = pcall(require, "pomo")
				if not ok then
					return ""
				end

				local timer = pomo.get_first_to_finish()
				if timer == nil then
					return ""
				end

				return "󰄉 " .. tostring(timer)
			end,
			"encoding",
			"fileformat",
			"filetype",
		},
		lualine_z = {
			{ "location", separator = { left = "", right = "" }, left_padding = 1 },
		},
	},
})
