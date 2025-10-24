local themes = require("colorscheme-picker.themes")

local M = {}

function M.pick()
	local available_themes = themes.get_themes()

	if #available_themes == 0 then
		vim.notify("No themes available!", vim.log.levels.WARN)
		return
	end

	local current_index = 1
	local original_theme = themes.get_current_theme()

	-- Find current theme index
	for i, name in ipairs(available_themes) do
		if name == original_theme then
			current_index = i
			break
		end
	end

	-- Create floating window
	local buf = vim.api.nvim_create_buf(false, true)
	local width = 50
	local height = math.min(#available_themes + 4, 20)
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
		for i, name in ipairs(available_themes) do
			if i == current_index then
				table.insert(lines, "● " .. name)
			else
				table.insert(lines, "  " .. name)
			end
		end
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
		themes.apply_theme(available_themes[current_index])
	end

	update_display()

	-- Key mappings
	local opts = { noremap = true, silent = true, buffer = buf }

	-- Navigate down
	local function nav_down()
		current_index = current_index % #available_themes + 1
		update_display()
	end

	-- Navigate up
	local function nav_up()
		current_index = current_index - 1
		if current_index < 1 then
			current_index = #available_themes
		end
		update_display()
	end

	-- Apply current theme
	local function apply_current()
		vim.api.nvim_win_close(win, true)
		vim.notify("Applied theme: " .. available_themes[current_index], vim.log.levels.INFO)
	end

	-- Cancel and restore
	local function cancel()
		vim.api.nvim_win_close(win, true)
		if original_theme and themes.registered_themes[original_theme] then
			themes.apply_theme(original_theme)
		end
	end

	vim.keymap.set("n", "j", nav_down, opts)
	vim.keymap.set("n", "<Down>", nav_down, opts)
	vim.keymap.set("n", "k", nav_up, opts)
	vim.keymap.set("n", "<Up>", nav_up, opts)
	vim.keymap.set("n", "<CR>", apply_current, opts)
	vim.keymap.set("n", "<Esc>", cancel, opts)
	vim.keymap.set("n", "q", cancel, opts)
end

return M
