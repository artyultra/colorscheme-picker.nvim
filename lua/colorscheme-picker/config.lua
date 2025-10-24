local M = {}

-- Default configuration
M.options = {
	default_theme = nil,
	enable_default_keymaps = true,
	telescope = true,
	persist_theme = true, -- NEW: Enable theme persistence
	persist_path = vim.fn.stdpath("data") .. "/colorscheme-picker.json", -- NEW: Where to save
	custom_themes_path = nil,
}

-- Setup configuration with user options
function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

-- Get a configuration value
function M.get(key)
	return M.options[key]
end

-- Set a configuration value
function M.set(key, value)
	M.options[key] = value
end

-- Get all options
function M.get_all()
	return M.options
end

return M
