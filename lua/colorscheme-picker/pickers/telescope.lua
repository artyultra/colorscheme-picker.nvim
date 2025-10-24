local themes = require("colorscheme-picker.themes")
local config = require("colorscheme-picker.config")

local M = {}

function M.pick()
	if not config.get("telescope") then
		require("colorscheme-picker.pickers.simple").pick()
		return
	end

	local has_telescope = pcall(require, "telescope")
	if not has_telescope then
		vim.notify("Telescope not found! Using simple picker", vim.log.levels.WARN)
		require("colorscheme-picker.pickers.simple").pick()
		return
	end

	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local available_themes = themes.get_themes()
	local original_theme = themes.get_current_theme()

	pickers
		.new({}, {
			prompt_title = "Colorscheme Picker (preview with ↑↓ or Ctrl-j/k)",
			finder = finders.new_table({
				results = available_themes,
				entry_maker = function(entry)
					local display = entry
					if themes.get_current_theme() == entry then
						display = "● " .. entry .. " (current)"
					end
					return {
						value = entry,
						display = display,
						ordinal = entry,
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				-- Apply and close on Enter
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					if selection then
						themes.apply_theme(selection.value)
						vim.notify("Applied theme: " .. selection.value, vim.log.levels.INFO)
					end
				end)

				-- Live preview function
				local function preview_current()
					local selection = action_state.get_selected_entry()
					if selection then
						themes.apply_theme(selection.value, true) -- true = skip saving to disk during preview
					end
				end

				-- Preview on movement (Ctrl-j and Ctrl-k)
				map("i", "<C-j>", function()
					actions.move_selection_next(prompt_bufnr)
					preview_current()
				end)

				map("i", "<C-k>", function()
					actions.move_selection_previous(prompt_bufnr)
					preview_current()
				end)

				map("n", "<C-j>", function()
					actions.move_selection_next(prompt_bufnr)
					preview_current()
				end)

				map("n", "<C-k>", function()
					actions.move_selection_previous(prompt_bufnr)
					preview_current()
				end)

				-- Also preview on regular j/k in normal mode
				map("n", "j", function()
					actions.move_selection_next(prompt_bufnr)
					preview_current()
				end)

				map("n", "k", function()
					actions.move_selection_previous(prompt_bufnr)
					preview_current()
				end)

				-- Preview on arrow keys
				map("i", "<Down>", function()
					actions.move_selection_next(prompt_bufnr)
					preview_current()
				end)

				map("i", "<Up>", function()
					actions.move_selection_previous(prompt_bufnr)
					preview_current()
				end)

				map("n", "<Down>", function()
					actions.move_selection_next(prompt_bufnr)
					preview_current()
				end)

				map("n", "<Up>", function()
					actions.move_selection_previous(prompt_bufnr)
					preview_current()
				end)

				-- Manual preview trigger (Ctrl-p)
				map("i", "<C-p>", preview_current)
				map("n", "<C-p>", preview_current)

				-- Restore original theme on cancel
				local function restore_and_close()
					actions.close(prompt_bufnr)
					if original_theme and themes.registered_themes[original_theme] then
						themes.apply_theme(original_theme)
						vim.notify("Restored theme: " .. original_theme, vim.log.levels.INFO)
					end
				end

				map("i", "<Esc>", restore_and_close)
				map("n", "<Esc>", restore_and_close)
				map("n", "q", restore_and_close)

				return true
			end,
		})
		:find()
end

return M
