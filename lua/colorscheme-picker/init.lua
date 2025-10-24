local M = {}

-- Import submodules
local config = require("colorscheme-picker.config")
local themes = require("colorscheme-picker.themes")
local commands = require("colorscheme-picker.commands")

-- Re-export theme management functions
M.register_theme = themes.register_theme
M.apply_theme = themes.apply_theme
M.get_themes = themes.get_themes

-- Re-export picker functions
M.pick_theme_simple = function()
	require("colorscheme-picker.pickers.simple").pick()
end

M.pick_theme_telescope = function()
	require("colorscheme-picker.pickers.telescope").pick()
end

M.preview_themes = function()
	require("colorscheme-picker.pickers.preview").pick()
end

-- Setup function
function M.setup(opts)
	-- Setup configuration
	config.setup(opts or {})

	-- Load built-in themes
	themes.load_builtin_themes()

	-- Register user-provided themes
	if opts and opts.themes then
		for name, theme in pairs(opts.themes) do
			themes.register_theme(name, theme)
		end
	end

	-- Create user commands
	commands.setup()

	-- Set up default keymaps if enabled
	if config.get("enable_default_keymaps") then
		vim.keymap.set("n", "<leader>cs", "<cmd>ColorschemePicker<cr>", { desc = "Pick colorscheme" })
		vim.keymap.set("n", "<leader>cp", "<cmd>ColorschemePreview<cr>", { desc = "Preview colorschemes" })
		vim.keymap.set(
			"n",
			"<leader>ct",
			"<cmd>ColorschemePickerTelescope<cr>",
			{ desc = "Telescope colorscheme picker" }
		)
		vim.keymap.set("n", "<leader>cl", "<cmd>ColorschemeList<cr>", { desc = "List colorschemes" })
	end

	-- Apply default theme if specified
	local default_theme = config.get("default_theme")
	if default_theme then
		vim.defer_fn(function()
			themes.apply_theme(default_theme)
		end, 0)
	end
end

return M
