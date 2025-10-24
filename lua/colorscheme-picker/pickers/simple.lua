local themes = require("colorscheme-picker.themes")

local M = {}

function M.pick()
	local available_themes = themes.get_themes()

	if #available_themes == 0 then
		vim.notify("No themes available!", vim.log.levels.WARN)
		return
	end

	vim.ui.select(available_themes, {
		prompt = "Select Colorscheme:",
		format_item = function(item)
			if themes.get_current_theme() == item then
				return "● " .. item .. " (current)"
			end
			return "  " .. item
		end,
	}, function(choice)
		if choice then
			themes.apply_theme(choice)
		end
	end)
end

return M
