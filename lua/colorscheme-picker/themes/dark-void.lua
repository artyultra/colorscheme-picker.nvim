-- Darkvoid colorscheme for Neovim
-- Reference: https://github.com/darkvoid-theme/darkvoid.nvim

return function()
	local colors = {
		fg = "#c0c0c0",
		bg = "#1c1c1c",
		cursor = "#bdfe58",
		line_nr = "#404040",
		visual = "#303030",
		comment = "#585858",
		string = "#d1d1d1",
		func = "#e1e1e1",
		kw = "#f1f1f1",
		identifier = "#b1b1b1",
		type = "#a1a1a1",
		search_highlight = "#1bfd9c",
		operator = "#1bfd9c",
		bracket = "#e6e6e6",
		preprocessor = "#6a7a8a",
		bool = "#66b2b2",
		constant = "#b2d8d8",
		added = "#baffc9",
		changed = "#ffffba",
		removed = "#ffb3ba",
		error = "#dea6a0",
		warning = "#d6efd8",
		hint = "#bedc74",
		info = "#7fa1c3",
		pmenu_bg = "#1c1c1c",
		pmenu_sel_bg = "#1bfd9c",
		eob = "#3c3c3c",
		border = "#585858",
		title = "#bdfe58",
	}

	local highlights = {
		-- Editor UI
		Normal = { fg = colors.fg, bg = "NONE" },
		NormalFloat = { fg = colors.fg, bg = colors.bg },
		FloatBorder = { fg = colors.border },
		Visual = { bg = colors.visual, bold = true },
		VisualNOS = { bg = colors.visual },
		LineNr = { fg = colors.line_nr },
		CursorLineNr = { fg = colors.cursor },
		CursorLine = { bg = "NONE" },
		CursorColumn = { bg = colors.visual },
		SignColumn = { bg = "NONE" },
		ColorColumn = { bg = colors.visual },
		Whitespace = { fg = colors.comment },
		VertSplit = { fg = colors.border },
		WinSeparator = { fg = colors.border },

		-- Syntax highlighting
		Comment = { fg = colors.comment, italic = true },
		Constant = { fg = colors.constant },
		String = { fg = colors.string },
		Character = { fg = colors.string },
		Number = { fg = colors.constant },
		Boolean = { fg = colors.bool },
		Float = { fg = colors.constant },

		Identifier = { fg = colors.identifier },
		Function = { fg = colors.func, italic = true },
		Statement = { fg = colors.kw },
		Conditional = { fg = colors.kw },
		Repeat = { fg = colors.kw },
		Label = { fg = colors.kw },
		Operator = { fg = colors.operator },
		Keyword = { fg = colors.kw },
		Exception = { fg = colors.kw },

		PreProc = { fg = colors.preprocessor },
		Include = { fg = colors.preprocessor },
		Define = { fg = colors.preprocessor },
		Macro = { fg = colors.preprocessor },
		PreCondit = { fg = colors.preprocessor },

		Type = { fg = colors.type },
		StorageClass = { fg = colors.type },
		Structure = { fg = colors.type },
		Typedef = { fg = colors.type },

		Special = { fg = colors.bracket },
		SpecialChar = { fg = colors.bracket },
		Tag = { fg = colors.kw },
		Delimiter = { fg = colors.bracket },
		SpecialComment = { fg = colors.comment, italic = true },
		Debug = { fg = colors.constant },

		-- Error handling
		Error = { fg = colors.error },
		Todo = { fg = colors.bg, bg = colors.warning, bold = true },

		-- Popup menus
		Pmenu = { fg = colors.fg, bg = colors.pmenu_bg },
		PmenuSel = { fg = colors.pmenu_bg, bg = colors.pmenu_sel_bg, bold = true },
		PmenuSbar = { bg = colors.visual },
		PmenuThumb = { bg = colors.line_nr },

		-- Search
		Search = { fg = colors.search_highlight, bg = "NONE", bold = true },
		IncSearch = { fg = colors.search_highlight, bg = "NONE", bold = true },
		CurSearch = { fg = colors.search_highlight, bg = "NONE", bold = true },

		-- Diagnostics (LSP)
		DiagnosticError = { fg = colors.error },
		DiagnosticWarn = { fg = colors.warning },
		DiagnosticInfo = { fg = colors.info },
		DiagnosticHint = { fg = colors.hint },
		DiagnosticUnderlineError = { sp = colors.error, underline = true },
		DiagnosticUnderlineWarn = { sp = colors.warning, underline = true },
		DiagnosticUnderlineInfo = { sp = colors.info, underline = true },
		DiagnosticUnderlineHint = { sp = colors.hint, underline = true },

		-- Git
		DiffAdd = { fg = colors.added },
		DiffChange = { fg = colors.changed },
		DiffDelete = { fg = colors.removed },
		GitSignsAdd = { fg = colors.added },
		GitSignsChange = { fg = colors.changed },
		GitSignsDelete = { fg = colors.removed },

		-- Misc
		MatchParen = { fg = colors.constant, bold = true },
		Title = { fg = colors.title, bold = true },
		EndOfBuffer = { fg = colors.eob, bg = "NONE" },
		Cursor = { fg = colors.cursor },
	}

	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end

	vim.g.colors_name = "dark-void"
end
