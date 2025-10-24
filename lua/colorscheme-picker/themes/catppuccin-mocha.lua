-- Catppuccin Mocha colorscheme for Neovim
-- Reference: https://github.com/catppuccin/catppuccin

return function()
local colors = {
	-- Darkvoid base colors
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
	type_builtin = "#c5c5c5",
	search_highlight = "#1bfd9c",
	operator = "#1bfd9c",
	bracket = "#e6e6e6",
	preprocessor = "#6a7a8a",
	bool = "#66b2b2",
	constant = "#b2d8d8",

	-- Darkvoid git colors
	added = "#baffc9",
	changed = "#ffffba",
	removed = "#ffb3ba",

	-- Darkvoid UI colors
	pmenu_bg = "#1c1c1c",
	pmenu_sel_bg = "#1bfd9c",
	pmenu_fg = "#c0c0c0",
	eob = "#3c3c3c",
	border = "#585858",
	title = "#bdfe58",

	-- Darkvoid LSP diagnostic colors
	error = "#dea6a0",
	warning = "#d6efd8",
	hint = "#bedc74",
	info = "#7fa1c3",
}

local highlights = {
	-- Editor UI
	Normal = { fg = colors.fg, bg = "NONE" },
	NormalFloat = { fg = colors.fg, bg = colors.bg },
	FloatBorder = { fg = colors.border },
	Visual = { bg = colors.visual, style = "bold" },
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
	Comment = { fg = colors.comment, style = "italic" },
	Constant = { fg = colors.constant },
	String = { fg = colors.string },
	Character = { fg = colors.string },
	Number = { fg = colors.constant },
	Boolean = { fg = colors.bool },
	Float = { fg = colors.constant },

	Identifier = { fg = colors.identifier },
	Function = { fg = colors.func, style = "italic" },
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
	SpecialComment = { fg = colors.comment, style = "italic" },
	Debug = { fg = colors.constant },

	-- Underlined text
	Underlined = { style = "underline" },

	-- Error handling
	Error = { fg = colors.error },
	Todo = { fg = colors.bg, bg = colors.warning, style = "bold" },

	-- Popup menus
	Pmenu = { fg = colors.pmenu_fg, bg = colors.pmenu_bg },
	PmenuSel = { fg = colors.pmenu_bg, bg = colors.pmenu_sel_bg, style = "bold" },
	PmenuSbar = { bg = colors.visual },
	PmenuThumb = { bg = colors.line_nr },

	-- Search
	Search = { fg = colors.search_highlight, bg = "NONE", style = "bold" },
	IncSearch = { fg = colors.search_highlight, bg = "NONE", style = "bold" },
	CurSearch = { fg = colors.search_highlight, bg = "NONE", style = "bold" },

	-- Messages and prompts
	ErrorMsg = { fg = colors.error, style = "bold,italic" },
	WarningMsg = { fg = colors.warning },
	MoreMsg = { fg = colors.info },
	ModeMsg = { fg = colors.fg, style = "bold" },
	Question = { fg = colors.info },

	-- Diagnostics (LSP)
	DiagnosticError = { fg = colors.error },
	DiagnosticWarn = { fg = colors.warning },
	DiagnosticInfo = { fg = colors.info },
	DiagnosticHint = { fg = colors.hint },
	DiagnosticUnderlineError = { sp = colors.error, style = "underline" },
	DiagnosticUnderlineWarn = { sp = colors.warning, style = "underline" },
	DiagnosticUnderlineInfo = { sp = colors.info, style = "underline" },
	DiagnosticUnderlineHint = { sp = colors.hint, style = "underline" },
	DiagnosticVirtualTextError = { fg = colors.error },
	DiagnosticVirtualTextWarn = { fg = colors.warning },
	DiagnosticVirtualTextHint = { fg = colors.hint },
	DiagnosticVirtualTextInfo = { fg = colors.info },

	-- Status line
	StatusLine = { fg = colors.fg, bg = "NONE" },
	StatusLineNC = { fg = colors.fg, bg = "NONE" },

	-- Tab line
	TabLine = { fg = colors.comment, bg = colors.bg },
	TabLineSel = { fg = colors.search_highlight, bg = colors.visual },
	TabLineFill = { bg = colors.bg },

	-- Window
	WinBar = { fg = colors.cursor },
	WinBarNC = { fg = colors.comment },

	-- Git diff
	DiffAdd = { fg = colors.added },
	DiffChange = { fg = colors.changed },
	DiffDelete = { fg = colors.removed },
	DiffText = { fg = colors.info },
	GitSignsAdd = { fg = colors.added },
	GitSignsChange = { fg = colors.changed },
	GitSignsDelete = { fg = colors.removed },

	-- Folding
	Folded = { fg = colors.info, bg = colors.visual },
	FoldColumn = { fg = colors.line_nr, bg = colors.bg },

	-- Misc
	MatchParen = { fg = colors.constant, style = "bold" },
	NonText = { fg = colors.line_nr },
	SpecialKey = { fg = colors.line_nr },
	WildMenu = { fg = colors.fg, bg = colors.visual },
	Directory = { fg = colors.info },
	Title = { fg = colors.title, style = "bold" },
	Conceal = { fg = colors.comment },

	-- Spell checking
	SpellBad = { sp = colors.error, style = "undercurl" },
	SpellCap = { sp = colors.warning, style = "undercurl" },
	SpellLocal = { sp = colors.info, style = "undercurl" },
	SpellRare = { sp = colors.hint, style = "undercurl" },

	-- Quickfix
	QuickFixLine = { bg = colors.visual, style = "bold" },

	-- Terminal
	Terminal = { fg = colors.fg, bg = colors.bg },

	-- EndOfBuffer
	EndOfBuffer = { fg = colors.eob, bg = "NONE" },

	-- Cursor
	Cursor = { fg = colors.cursor, bg = "NONE" },
}

-- Apply highlights
for group, settings in pairs(highlights) do
	local gui_settings = {}

	if settings.fg then
		gui_settings.fg = settings.fg
	end

	if settings.bg then
		gui_settings.bg = settings.bg
	end

	if settings.sp then
		gui_settings.sp = settings.sp
	end

	if settings.style then
		local styles = {}
		for style in settings.style:gmatch("([^,]+)") do
			styles[style:gsub("^%s*(.-)%s*$", "%1")] = true
		end

		gui_settings.bold = styles.bold or nil
		gui_settings.italic = styles.italic or nil
		gui_settings.underline = styles.underline or nil
		gui_settings.undercurl = styles.undercurl or nil
		gui_settings.strikethrough = styles.strikethrough or nil
		gui_settings.reverse = styles.reverse or nil
	end

	vim.api.nvim_set_hl(0, group, gui_settings)
end

-- Terminal colors (using darkvoid palette)
vim.g.terminal_color_0 = colors.bg
vim.g.terminal_color_1 = colors.error
vim.g.terminal_color_2 = colors.added
vim.g.terminal_color_3 = colors.changed
vim.g.terminal_color_4 = colors.info
vim.g.terminal_color_5 = colors.kw
vim.g.terminal_color_6 = colors.operator
vim.g.terminal_color_7 = colors.fg
vim.g.terminal_color_8 = colors.comment
vim.g.terminal_color_9 = colors.removed
vim.g.terminal_color_10 = colors.hint
vim.g.terminal_color_11 = colors.warning
vim.g.terminal_color_12 = colors.func
vim.g.terminal_color_13 = colors.preprocessor
vim.g.terminal_color_14 = colors.search_highlight
vim.g.terminal_color_15 = colors.string

-- Set colorscheme name
vim.g.colors_name = "catppuccin-mocha-darkvoid"
end
