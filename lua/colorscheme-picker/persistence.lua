local M = {}
local config = require("colorscheme-picker.config")

-- Read the saved theme from disk
function M.load_saved_theme()
	if not config.get("persist_theme") then
		return nil
	end

	local persist_path = config.get("persist_path")

	-- Check if file exists
	local file = io.open(persist_path, "r")
	if not file then
		return nil
	end

	-- Read and parse JSON
	local content = file:read("*all")
	file:close()

	if not content or content == "" then
		return nil
	end

	local ok, data = pcall(vim.json.decode, content)
	if not ok or not data or not data.theme then
		return nil
	end

	return data.theme
end

-- Save the current theme to disk
function M.save_theme(theme_name)
	if not config.get("persist_theme") then
		return false
	end

	local persist_path = config.get("persist_path")

	-- Create data directory if it doesn't exist
	local data_dir = vim.fn.fnamemodify(persist_path, ":h")
	if vim.fn.isdirectory(data_dir) == 0 then
		vim.fn.mkdir(data_dir, "p")
	end

	-- Prepare data
	local data = {
		theme = theme_name,
		last_updated = os.time(),
	}

	-- Write to file
	local file = io.open(persist_path, "w")
	if not file then
		vim.notify("Failed to save theme to: " .. persist_path, vim.log.levels.ERROR)
		return false
	end

	local json_data = vim.json.encode(data)
	file:write(json_data)
	file:close()

	return true
end

-- Clear saved theme
function M.clear_saved_theme()
	local persist_path = config.get("persist_path")
	if vim.fn.filereadable(persist_path) == 1 then
		vim.fn.delete(persist_path)
	end
end

return M
