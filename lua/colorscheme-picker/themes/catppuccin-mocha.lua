-- Catppuccin Mocha colorscheme for Neovim
-- Reference: https://github.com/catppuccin/catppuccin

local colors = {
	-- Base colors
	rosewater = "#f5e0dc",
	flamingo = "#f2cdcd",
	pink = "#f5c2e7",
	mauve = "#cba6f7",
	red = "#f38ba8",
	maroon = "#eba0ac",
	peach = "#fab387",
	yellow = "#f9e2af",
	green = "#a6e3a1",
	teal = "#94e2d5",
	sky = "#89dceb",
	sapphire = "#74c7ec",
	blue = "#89b4fa",
	lavender = "#b4befe",

	-- Neutral colors
	text = "#cdd6f4",
	subtext1 = "#bac2de",
	subtext0 = "#a6adc8",
	overlay2 = "#9399b2",
	overlay1 = "#7f849c",
	overlay0 = "#6c7086",
	surface2 = "#585b70",
	surface1 = "#45475a",
	surface0 = "#313244",

	-- Base backgrounds
	base = "#1e1e2e",
	mantle = "#181825",
	crust = "#11111b",
}
local highlights = {
	-- Editor UI
	Normal = { fg = colors.text, bg = "NONE" },
	NormalFloat = { fg = colors.text, bg = colors.mantle },
	FloatBorder = { fg = colors.blue },
	Visual = { bg = colors.surface1, style = "bold" },
	VisualNOS = { bg = colors.surface1 },
	LineNr = { fg = colors.blue },
	CursorLineNr = { fg = colors.rosewater },
	CursorLine = { bg = "NONE" },
	CursorColumn = { bg = colors.surface0 },
	SignColumn = { bg = "NONE" },
	ColorColumn = { bg = colors.surface0 },
	Whitespace = { fg = colors.surface2 },
	VertSplit = { fg = colors.crust },
	WinSeparator = { fg = colors.crust },

	-- Syntax highlighting
	Comment = { fg = colors.overlay2, style = "italic" },
	Constant = { fg = colors.peach },
	String = { fg = colors.green },
	Character = { fg = colors.teal },
	Number = { fg = colors.peach },
	Boolean = { fg = colors.peach },
	Float = { fg = colors.peach },

	Identifier = { fg = colors.flamingo },
	Function = { fg = colors.blue, style = "italic" },
	Statement = { fg = colors.mauve },
	Conditional = { fg = colors.mauve },
	Repeat = { fg = colors.mauve },
	Label = { fg = colors.sapphire },
	Operator = { fg = colors.sky },
	Keyword = { fg = colors.mauve },
	Exception = { fg = colors.peach },

	PreProc = { fg = colors.pink },
	Include = { fg = colors.pink },
	Define = { fg = colors.pink },
	Macro = { fg = colors.pink },
	PreCondit = { fg = colors.pink },

	Type = { fg = colors.yellow },
	StorageClass = { fg = colors.yellow },
	Structure = { fg = colors.yellow },
	Typedef = { fg = colors.yellow },

	Special = { fg = colors.pink },
	SpecialChar = { fg = colors.pink },
	Tag = { fg = colors.mauve },
	Delimiter = { fg = colors.overlay2 },
	SpecialComment = { fg = colors.overlay0, style = "italic" },
	Debug = { fg = colors.peach },

	-- Underlined text
	Underlined = { style = "underline" },

	-- Error handling
	Error = { fg = colors.red },
	Todo = { fg = colors.base, bg = colors.yellow, style = "bold" },

	-- Popup menus
	Pmenu = { fg = colors.overlay2, bg = colors.surface0 },
	PmenuSel = { fg = colors.text, bg = colors.surface1, style = "bold" },
	PmenuSbar = { bg = colors.surface1 },
	PmenuThumb = { bg = colors.overlay0 },

	-- Search
	Search = { fg = colors.base, bg = colors.sky },
	IncSearch = { fg = colors.base, bg = colors.rosewater },
	CurSearch = { fg = colors.base, bg = colors.red },

	-- Messages and prompts
	ErrorMsg = { fg = colors.red, style = "bold,italic" },
	WarningMsg = { fg = colors.yellow },
	MoreMsg = { fg = colors.blue },
	ModeMsg = { fg = colors.text, style = "bold" },
	Question = { fg = colors.blue },

	-- Diagnostics (LSP)
	DiagnosticError = { fg = colors.red },
	DiagnosticWarn = { fg = colors.yellow },
	DiagnosticInfo = { fg = colors.sky },
	DiagnosticHint = { fg = colors.teal },
	DiagnosticUnderlineError = { sp = colors.red, style = "undercurl" },
	DiagnosticUnderlineWarn = { sp = colors.yellow, style = "undercurl" },
	DiagnosticUnderlineInfo = { sp = colors.sky, style = "undercurl" },
	DiagnosticUnderlineHint = { sp = colors.teal, style = "undercurl" },

	-- Status line
	StatusLine = { fg = colors.text, bg = "NONE" },
	StatusLineNC = { fg = colors.text, bg = "NONE" },

	-- Tab line
	TabLine = { fg = colors.surface1, bg = colors.mantle },
	TabLineSel = { fg = colors.green, bg = colors.surface1 },
	TabLineFill = { bg = colors.mantle },

	-- Window
	WinBar = { fg = colors.rosewater },
	WinBarNC = { fg = colors.overlay1 },

	-- Git diff
	DiffAdd = { fg = colors.green },
	DiffChange = { fg = colors.yellow },
	DiffDelete = { fg = colors.red },
	DiffText = { fg = colors.blue },
	GitSignsAdd = { fg = colors.green },
	GitSignsChange = { fg = colors.yellow },
	GitSignsDelete = { fg = colors.red },

	-- Folding
	Folded = { fg = colors.blue, bg = colors.surface0 },
	FoldColumn = { fg = colors.overlay0, bg = colors.base },

	-- Misc
	MatchParen = { fg = colors.peach, style = "bold" },
	NonText = { fg = colors.overlay0 },
	SpecialKey = { fg = colors.overlay0 },
	WildMenu = { fg = colors.text, bg = colors.surface0 },
	Directory = { fg = colors.blue },
	Title = { fg = colors.blue, style = "bold" },
	Conceal = { fg = colors.overlay1 },

	-- Spell checking
	SpellBad = { sp = colors.red, style = "undercurl" },
	SpellCap = { sp = colors.yellow, style = "undercurl" },
	SpellLocal = { sp = colors.blue, style = "undercurl" },
	SpellRare = { sp = colors.green, style = "undercurl" },

	-- Quickfix
	QuickFixLine = { bg = colors.surface1, style = "bold" },

	-- Terminal
	Terminal = { fg = colors.text, bg = colors.base },
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

-- Terminal colors
vim.g.terminal_color_0 = colors.surface1
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.teal
vim.g.terminal_color_7 = colors.subtext1
vim.g.terminal_color_8 = colors.surface2
vim.g.terminal_color_9 = colors.red
vim.g.terminal_color_10 = colors.green
vim.g.terminal_color_11 = colors.yellow
vim.g.terminal_color_12 = colors.blue
vim.g.terminal_color_13 = colors.pink
vim.g.terminal_color_14 = colors.teal
vim.g.terminal_color_15 = colors.subtext0

-- Set colorscheme name
vim.g.colors_name = "catppuccin-mocha"
