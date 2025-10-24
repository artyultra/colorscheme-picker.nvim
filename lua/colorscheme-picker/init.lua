local M = {}

-- Store available themes
M.themes = {}
M.config = {
	default_theme = nil,
	enable_default_keymaps = true,
	telescope = true,
}

-- Register a theme
function M.register_theme(name, theme_fn)
	M.themes[name] = theme_fn
end

-- Apply a theme
function M.apply_theme(name)
	if not M.themes[name] then
		vim.notify("Theme '" .. name .. "' not found!", vim.log.levels.ERROR)
		return false
	end

	-- Clear existing highlights
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end

	-- Load the theme
	local ok, err = pcall(M.themes[name])
	if not ok then
		vim.notify("Error loading theme '" .. name .. "': " .. tostring(err), vim.log.levels.ERROR)
		return false
	end

	-- Save the current theme name
	vim.g.current_colorscheme = name
	vim.g.colors_name = name

	return true
end

-- Get list of available themes
function M.get_themes()
	local theme_names = {}
	for name, _ in pairs(M.themes) do
		table.insert(theme_names, name)
	end
	table.sort(theme_names)
	return theme_names
end

-- Show theme picker with telescope (if available)
function M.pick_theme_telescope()
	if not M.config.telescope then
		M.pick_theme_simple()
		return
	end

	local has_telescope, telescope = pcall(require, "telescope")
	if not has_telescope then
		vim.notify("Telescope not found! Using simple picker", vim.log.levels.WARN)
		M.pick_theme_simple()
		return
	end

	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local themes = M.get_themes()
	local original_theme = vim.g.current_colorscheme

	pickers
		.new({}, {
			prompt_title = "Colorscheme Picker",
			finder = finders.new_table({
				results = themes,
				entry_maker = function(entry)
					local display = entry
					if vim.g.current_colorscheme == entry then
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
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					M.apply_theme(selection.value)
				end)

				-- Preview theme on Ctrl-p
				map("i", "<C-p>", function()
					local selection = action_state.get_selected_entry()
					if selection then
						M.apply_theme(selection.value)
					end
				end)

				map("n", "<C-p>", function()
					local selection = action_state.get_selected_entry()
					if selection then
						M.apply_theme(selection.value)
					end
				end)

				-- Restore original theme on Escape
				local function restore_and_close()
					actions.close(prompt_bufnr)
					if original_theme and M.themes[original_theme] then
						M.apply_theme(original_theme)
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

-- Simple vim.ui.select picker (no telescope required)
function M.pick_theme_simple()
	local themes = M.get_themes()

	if #themes == 0 then
		vim.notify("No themes available!", vim.log.levels.WARN)
		return
	end

	vim.ui.select(themes, {
		prompt = "Select Colorscheme:",
		format_item = function(item)
			if vim.g.current_colorscheme == item then
				return "● " .. item .. " (current)"
			end
			return "  " .. item
		end,
	}, function(choice)
		if choice then
			M.apply_theme(choice)
		end
	end)
end

-- Preview themes with live update
function M.preview_themes()
	local themes = M.get_themes()

	if #themes == 0 then
		vim.notify("No themes available!", vim.log.levels.WARN)
		return
	end

	local current_index = 1
	local original_theme = vim.g.current_colorscheme

	-- Find current theme index
	for i, name in ipairs(themes) do
		if name == original_theme then
			current_index = i
			break
		end
	end

	-- Create floating window
	local buf = vim.api.nvim_create_buf(false, true)
	local width = 50
	local height = math.min(#themes + 4, 20)
	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = (vim.o.columns - width) / 2,
		row = (vim.o.lines - height) / 2,
		style = "minimal",
		border = "rounded",
		title = " Colorscheme Preview ",
		title_pos = "center",
	})

	-- Make buffer modifiable for updates
	vim.api.nvim_set_option_value("modifiable", true, { buf = buf })

	-- Update display
	local function update_display()
		local lines = {
			"j/k: navigate | Enter: apply | Esc/q: cancel",
			"",
		}
		for i, name in ipairs(themes) do
			if i == current_index then
				table.insert(lines, "● " .. name)
			else
				table.insert(lines, "  " .. name)
			end
		end
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		M.apply_theme(themes[current_index])
	end

	update_display()

	-- Key mappings
	local opts = { noremap = true, silent = true, buffer = buf }

	vim.keymap.set("n", "j", function()
		current_index = current_index % #themes + 1
		update_display()
	end, opts)

	vim.keymap.set("n", "<Down>", function()
		current_index = current_index % #themes + 1
		update_display()
	end, opts)

	vim.keymap.set("n", "k", function()
		current_index = current_index - 1
		if current_index < 1 then
			current_index = #themes
		end
		update_display()
	end, opts)

	vim.keymap.set("n", "<Up>", function()
		current_index = current_index - 1
		if current_index < 1 then
			current_index = #themes
		end
		update_display()
	end, opts)

	vim.keymap.set("n", "<CR>", function()
		vim.api.nvim_win_close(win, true)
		vim.notify("Applied theme: " .. themes[current_index], vim.log.levels.INFO)
	end, opts)

	local function cancel()
		vim.api.nvim_win_close(win, true)
		if original_theme and M.themes[original_theme] then
			M.apply_theme(original_theme)
		end
	end

	vim.keymap.set("n", "<Esc>", cancel, opts)
	vim.keymap.set("n", "q", cancel, opts)
end

-- Load built-in themes
function M.load_builtin_themes()
	local builtin_themes = { "dark-void", "muted-catppuccin", "rose-pine" }

	for _, theme_name in ipairs(builtin_themes) do
		local ok, theme = pcall(require, "colorscheme-picker.themes." .. theme_name)
		if ok and type(theme) == "function" then
			M.register_theme(theme_name, theme)
		end
	end
end

-- Setup function
function M.setup(opts)
	opts = opts or {}

	-- Merge user config with defaults
	M.config = vim.tbl_deep_extend("force", M.config, opts)

	-- Load built-in themes
	M.load_builtin_themes()

	-- Register user-provided themes
	if opts.themes then
		for name, theme in pairs(opts.themes) do
			M.register_theme(name, theme)
		end
	end

	-- Create commands
	vim.api.nvim_create_user_command("ColorschemeList", function()
		local themes = M.get_themes()
		if #themes == 0 then
			print("No colorschemes available")
			return
		end
		print("Available colorschemes:")
		for _, name in ipairs(themes) do
			local marker = (vim.g.current_colorscheme == name) and " ●" or ""
			print("  " .. name .. marker)
		end
	end, {})

	vim.api.nvim_create_user_command("ColorschemePicker", function()
		M.pick_theme_simple()
	end, {})

	vim.api.nvim_create_user_command("ColorschemePickerTelescope", function()
		M.pick_theme_telescope()
	end, {})

	vim.api.nvim_create_user_command("ColorschemePreview", function()
		M.preview_themes()
	end, {})

	vim.api.nvim_create_user_command("Colorscheme", function(cmd_opts)
		M.apply_theme(cmd_opts.args)
	end, {
		nargs = 1,
		complete = function()
			return M.get_themes()
		end,
	})

	-- Set up default keymaps if enabled
	if M.config.enable_default_keymaps then
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
	if M.config.default_theme then
		vim.defer_fn(function()
			M.apply_theme(M.config.default_theme)
		end, 0)
	end
end

return M
