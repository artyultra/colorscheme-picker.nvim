local M = {}

-- Import submodules
local config = require("colorscheme-picker.config")
local themes = require("colorscheme-picker.themes")
local commands = require("colorscheme-picker.commands")
local persistence = require("colorscheme-picker.persistence")

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
			"<leader>th",
			"<cmd>ColorschemePickerTelescope<cr>",
			{ desc = "Telescope colorscheme picker" }
		)
		vim.keymap.set("n", "<leader>cl", "<cmd>ColorschemeList<cr>", { desc = "List colorschemes" })
	end

	-- Determine which theme to apply on startup
	local theme_to_apply = nil

	-- Priority 1: User specified default_theme in config
	if config.get("default_theme") then
		theme_to_apply = config.get("default_theme")
	-- Priority 2: Load last saved theme (if persistence is enabled)
	elseif config.get("persist_theme") then
		local saved_theme = persistence.load_saved_theme()
		if saved_theme and themes.registered_themes[saved_theme] then
			theme_to_apply = saved_theme
		end
	end

	-- Apply the determined theme
	if theme_to_apply then
		vim.defer_fn(function()
			themes.apply_theme(theme_to_apply)
		end, 0)
	end
end

return M
