require("bufferline").setup {
	options ={
		style_preset = require("bufferline").style_preset.italic, -- or bufferline.style_preset.minimal,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end
	}
}
