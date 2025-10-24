local themes = require("colorscheme-picker.themes")
local persistence = require("colorscheme-picker.persistence")
local config = require("colorscheme-picker.config")

local M = {}

function M.setup()
	-- List all available colorschemes
	vim.api.nvim_create_user_command("ColorschemeList", function()
		local available_themes = themes.get_themes()
		if #available_themes == 0 then
			print("No colorschemes available")
			return
		end
		print("Available colorschemes:")
		for _, name in ipairs(available_themes) do
			local marker = (themes.get_current_theme() == name) and " ●" or ""
			print("  " .. name .. marker)
		end

		-- Show saved theme info
		if config.get("persist_theme") then
			local saved = persistence.load_saved_theme()
			if saved then
				print("\nSaved theme: " .. saved)
			end
		end
	end, { desc = "List all available colorschemes" })

	-- Simple picker
	vim.api.nvim_create_user_command("ColorschemePicker", function()
		require("colorscheme-picker.pickers.simple").pick()
	end, { desc = "Open simple colorscheme picker" })

	-- Telescope picker
	vim.api.nvim_create_user_command("ColorschemePickerTelescope", function()
		require("colorscheme-picker.pickers.telescope").pick()
	end, { desc = "Open telescope colorscheme picker" })

	-- Preview picker
	vim.api.nvim_create_user_command("ColorschemePreview", function()
		require("colorscheme-picker.pickers.preview").pick()
	end, { desc = "Open interactive colorscheme preview" })

	-- Apply specific colorscheme with tab completion
	vim.api.nvim_create_user_command("Colorscheme", function(cmd_opts)
		themes.apply_theme(cmd_opts.args)
	end, {
		nargs = 1,
		complete = function()
			return themes.get_themes()
		end,
		desc = "Apply a specific colorscheme",
	})

	-- NEW: Clear saved theme
	vim.api.nvim_create_user_command("ColorschemeClearSaved", function()
		persistence.clear_saved_theme()
		vim.notify("Cleared saved colorscheme", vim.log.levels.INFO)
	end, { desc = "Clear saved colorscheme preference" })

	-- NEW: Show current saved theme
	vim.api.nvim_create_user_command("ColorschemeShowSaved", function()
		if not config.get("persist_theme") then
			print("Theme persistence is disabled")
			return
		end

		local saved = persistence.load_saved_theme()
		if saved then
			print("Saved theme: " .. saved)
		else
			print("No saved theme found")
		end
	end, { desc = "Show currently saved colorscheme" })
end

return M
