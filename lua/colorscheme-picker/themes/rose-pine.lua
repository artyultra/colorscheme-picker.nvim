-- Rose Pine palette
-- Reference: https://github.com/rose-pine/rose-pine-theme

return function()
	-- Add your rose-pine colors here
	local colors = {
		base = "#191724",
		surface = "#1f1d2e",
		overlay = "#26233a",
		muted = "#6e6a86",
		subtle = "#908caa",
		text = "#e0def4",
		love = "#eb6f92",
		gold = "#f6c177",
		rose = "#ebbcba",
		pine = "#31748f",
		foam = "#9ccfd8",
		iris = "#c4a7e7",
		highlight_low = "#21202e",
		highlight_med = "#403d52",
		highlight_high = "#524f67",
	}

	local highlights = {
		Normal = { fg = colors.text, bg = "NONE" },
		Comment = { fg = colors.muted, italic = true },
		String = { fg = colors.gold },
		Function = { fg = colors.rose, italic = true },
		Keyword = { fg = colors.pine },
		Identifier = { fg = colors.foam },
		Type = { fg = colors.foam },
		Operator = { fg = colors.subtle },
		LineNr = { fg = colors.muted },
		Visual = { bg = colors.highlight_med },
		Search = { fg = colors.base, bg = colors.rose },
		DiagnosticError = { fg = colors.love },
		DiagnosticWarn = { fg = colors.gold },
		DiagnosticInfo = { fg = colors.foam },
		DiagnosticHint = { fg = colors.iris },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end

	vim.g.colors_name = "rose-pine"
end
