return function()
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
		none = "NONE",
	}

	local highlights = {
		Normal = { fg = colors.text, bg = colors.base },
		NormalFloat = { fg = colors.text, bg = colors.surface },
		NormalNC = { fg = colors.text, bg = colors.base },

		Cursor = { fg = colors.base, bg = colors.text },
		CursorLine = { bg = colors.surface },
		CursorLineNr = { fg = colors.text, bold = true },
		CursorColumn = { bg = colors.surface },

		LineNr = { fg = colors.muted },
		SignColumn = { bg = colors.none },
		FoldColumn = { fg = colors.muted },

		Visual = { bg = colors.highlight_med },
		VisualNOS = { bg = colors.highlight_med },

		VertSplit = { fg = colors.overlay },
		WinSeparator = { fg = colors.overlay },
		FloatBorder = { fg = colors.overlay },

		ColorColumn = { bg = colors.surface },
		Whitespace = { fg = colors.overlay },
		EndOfBuffer = { fg = colors.base },
		MatchParen = { fg = colors.gold, bold = true },
		Title = { fg = colors.iris, bold = true },

		Comment = { fg = colors.muted, italic = true },

		Constant = { fg = colors.gold },
		String = { fg = colors.rose },
		Character = { fg = colors.rose },
		Number = { fg = colors.gold },
		Boolean = { fg = colors.rose },
		Float = { fg = colors.gold },

		Identifier = { fg = colors.text },
		Function = { fg = colors.foam },

		Statement = { fg = colors.pine },
		Conditional = { fg = colors.pine },
		Repeat = { fg = colors.pine },
		Label = { fg = colors.pine },
		Operator = { fg = colors.subtle },
		Keyword = { fg = colors.pine },
		Exception = { fg = colors.pine },

		PreProc = { fg = colors.iris },
		Include = { fg = colors.iris },
		Define = { fg = colors.iris },
		Macro = { fg = colors.iris },
		PreCondit = { fg = colors.iris },

		Type = { fg = colors.foam },
		StorageClass = { fg = colors.foam },
		Structure = { fg = colors.foam },
		Typedef = { fg = colors.foam },

		Special = { fg = colors.subtle },
		SpecialChar = { fg = colors.subtle },
		Tag = { fg = colors.foam },
		Delimiter = { fg = colors.subtle },
		SpecialComment = { fg = colors.muted, italic = true },
		Debug = { fg = colors.rose },

		Error = { fg = colors.love, bold = true },
		Todo = { fg = colors.base, bg = colors.iris, bold = true },

		Search = { bg = colors.iris, fg = colors.base },
		IncSearch = { bg = colors.iris, fg = colors.base },
		CurSearch = { bg = colors.love, fg = colors.base },
		Substitute = { bg = colors.gold, fg = colors.base },

		Pmenu = { fg = colors.text, bg = colors.surface },
		PmenuSel = { fg = colors.text, bg = colors.overlay },
		PmenuSbar = { bg = colors.overlay },
		PmenuThumb = { bg = colors.muted },

		DiagnosticError = { fg = colors.love },
		DiagnosticWarn = { fg = colors.gold },
		DiagnosticInfo = { fg = colors.foam },
		DiagnosticHint = { fg = colors.iris },

		DiagnosticUnderlineError = { sp = colors.love, underline = true },
		DiagnosticUnderlineWarn = { sp = colors.gold, underline = true },
		DiagnosticUnderlineInfo = { sp = colors.foam, underline = true },
		DiagnosticUnderlineHint = { sp = colors.iris, underline = true },

		DiagnosticVirtualTextError = { fg = colors.love },
		DiagnosticVirtualTextWarn = { fg = colors.gold },
		DiagnosticVirtualTextInfo = { fg = colors.foam },
		DiagnosticVirtualTextHint = { fg = colors.iris },

		DiffAdd = { fg = colors.foam },
		DiffChange = { fg = colors.gold },
		DiffDelete = { fg = colors.love },
		DiffText = { bg = colors.gold, fg = colors.base },

		GitSignsAdd = { fg = colors.foam },
		GitSignsChange = { fg = colors.gold },
		GitSignsDelete = { fg = colors.love },

		["@comment"] = { link = "Comment" },
		["@error"] = { link = "Error" },
		["@operator"] = { link = "Operator" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.return"] = { link = "Keyword" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { fg = colors.love },
		["@string"] = { link = "String" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@constant"] = { link = "Constant" },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { link = "Type" },

		StatusLine = { fg = colors.text, bg = colors.surface },
		StatusLineNC = { fg = colors.muted, bg = colors.surface },
		TabLine = { fg = colors.subtle, bg = colors.surface },
		TabLineFill = { bg = colors.base },
		TabLineSel = { fg = colors.text, bg = colors.overlay },

		SpellBad = { sp = colors.love, undercurl = true },
		SpellCap = { sp = colors.gold, undercurl = true },
		SpellLocal = { sp = colors.foam, undercurl = true },
		SpellRare = { sp = colors.iris, undercurl = true },

		Folded = { fg = colors.text, bg = colors.surface },

		ModeMsg = { fg = colors.text },
		MoreMsg = { fg = colors.foam },
		MsgArea = { fg = colors.text },
		Question = { fg = colors.foam },
		ErrorMsg = { fg = colors.love },
		WarningMsg = { fg = colors.gold },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end

	vim.g.colors_name = "rosepine_dark"
end
