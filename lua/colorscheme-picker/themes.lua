local M = {}

-- Store available themes
M.registered_themes = {}

-- Register a theme
function M.register_theme(name, theme_fn)
	if type(theme_fn) ~= "function" then
		vim.notify("Theme '" .. name .. "' must be a function, got " .. type(theme_fn), vim.log.levels.ERROR)
		return false
	end
	M.registered_themes[name] = theme_fn
	return true
end

-- Apply a theme
function M.apply_theme(name, skip_save)
	if not M.registered_themes[name] then
		vim.notify("Theme '" .. name .. "' not found!", vim.log.levels.ERROR)
		return false
	end

	-- Clear existing highlights
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Load the theme
	local ok, err = pcall(M.registered_themes[name])
	if not ok then
		vim.notify("Error loading theme '" .. name .. "': " .. tostring(err), vim.log.levels.ERROR)
		return false
	end

	-- Save the current theme name
	vim.g.current_colorscheme = name
	vim.g.colors_name = name

	-- Persist the theme selection (unless explicitly skipped)
	if not skip_save then
		local persistence = require("colorscheme-picker.persistence")
		persistence.save_theme(name)
	end

	return true
end

-- Get list of available themes
function M.get_themes()
	local theme_names = {}
	for name, _ in pairs(M.registered_themes) do
		table.insert(theme_names, name)
	end
	table.sort(theme_names)
	return theme_names
end

-- Get current theme
function M.get_current_theme()
	return vim.g.current_colorscheme
end

-- Automatically scan and load all themes from the themes folder
function M.load_builtin_themes()
	-- Get the path to the themes directory
	local themes_dir = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h") .. "/themes"

	-- Check if themes directory exists
	if vim.fn.isdirectory(themes_dir) == 0 then
		vim.notify("Themes directory not found: " .. themes_dir, vim.log.levels.WARN)
		return
	end

	-- Get all .lua files in the themes directory
	local theme_files = vim.fn.glob(themes_dir .. "/*.lua", false, true)

	if #theme_files == 0 then
		vim.notify("No theme files found in: " .. themes_dir, vim.log.levels.WARN)
		return
	end

	local loaded_count = 0
	local failed_themes = {}

	-- Load each theme file
	for _, file_path in ipairs(theme_files) do
		-- Extract theme name from filename (remove .lua extension)
		local theme_name = vim.fn.fnamemodify(file_path, ":t:r")

		-- Try to require the theme module
		local ok, theme = pcall(require, "colorscheme-picker.themes." .. theme_name)

		if ok and type(theme) == "function" then
			M.register_theme(theme_name, theme)
			loaded_count = loaded_count + 1
		else
			table.insert(failed_themes, theme_name)
		end
	end

	-- Log results
	if loaded_count > 0 then
		vim.notify("Loaded " .. loaded_count .. " colorscheme(s)", vim.log.levels.INFO)
	end

	if #failed_themes > 0 then
		vim.notify("Failed to load themes: " .. table.concat(failed_themes, ", "), vim.log.levels.WARN)
	end
end

return M
