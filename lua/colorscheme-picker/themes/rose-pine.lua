-- Rose Pine palette
-- Reference: https://github.com/rose-pine/rose-pine-theme

local colors = {
	-- Base backgrounds
	base = "#191724", -- main background
	mantle = "#1f1d2e", -- second-level background
	crust = "#26233a", -- third-level background

	-- Surfaces & overlays
	surface0 = "#26233a",
	surface1 = "#2a2837",
	surface2 = "#3e3d49",
	overlay0 = "#393552",
	overlay1 = "#5A7777",
	overlay2 = "#56526e",

	-- Text & subtext
	text = "#e0def4",
	subtext0 = "#6e6a86",
	subtext1 = "#908caa",

	-- Accents from Rose Pine
	rosewater = "#f5e0dc", -- sometimes called 'rose'
	flamingo = "#d7827e", -- sometimes called 'love'
	pink = "#eb6f92",
	mauve = "#c4a7e7", -- 'iris'
	red = "#eb6f92", -- love
	maroon = "#eb6f92", -- also love
	peach = "#f6c177", -- 'gold'
	yellow = "#f6c177", -- also gold
	green = "#9ccfd8", -- 'foam'
	teal = "#31748f", -- 'pine'
	sky = "#56526e", -- reused subtle
	sapphire = "#31748f", -- also pine
	blue = "#31748f", -- also pine
	lavender = "#c4a7e7", -- iris
}

local highlights = {
	-- Editor UI
	Normal = { fg = colors.text, bg = colors.base },
	NormalFloat = { fg = colors.text, bg = colors.base },
	FloatBorder = { fg = colors.blue },
	Visual = { bg = colors.surface1 },
	VisualNOS = { bg = colors.surface1 },
	LineNr = { fg = colors.surface1 },
	CursorLineNr = { fg = colors.lavender },
	CursorLine = { bg = colors.surface0 },
	CursorColumn = { bg = colors.surface0 },
	SignColumn = { bg = colors.base },
	ColorColumn = { bg = colors.surface0 },
	Whitespace = { fg = colors.surface2 },
	VertSplit = { fg = colors.surface0 },

	-- Syntax
	Comment = { fg = colors.overlay1, italic = true },
	Constant = { fg = colors.peach },
	String = { fg = colors.green },
	Character = { fg = colors.teal },
	Number = { fg = colors.peach },
	Boolean = { fg = colors.peach },
	Float = { fg = colors.peach },

	Identifier = { fg = colors.mauve },
	Function = { fg = colors.blue },
	Statement = { fg = colors.mauve },
	Conditional = { fg = colors.mauve },
	Repeat = { fg = colors.mauve },
	Label = { fg = colors.sapphire },
	Operator = { fg = colors.sky },
	Keyword = { fg = colors.red },
	Exception = { fg = colors.red },

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
	Tag = { fg = colors.blue },
	Delimiter = { fg = colors.overlay2 },
	SpecialComment = { fg = colors.surface2 },
	Debug = { fg = colors.yellow },

	-- Menus
	Pmenu = { fg = colors.overlay2, bg = colors.surface0 },
	PmenuSel = { fg = colors.text, bg = colors.surface1 },
	PmenuSbar = { bg = colors.surface0 },
	PmenuThumb = { bg = colors.overlay0 },

	-- Search
	Search = { bg = colors.surface1, fg = colors.pink },
	IncSearch = { bg = colors.pink, fg = colors.mantle },

	-- Messages
	ErrorMsg = { fg = colors.red },
	WarningMsg = { fg = colors.yellow },
	MoreMsg = { fg = colors.blue },
	Question = { fg = colors.blue },

	-- Diagnostics
	DiagnosticError = { fg = colors.red },
	DiagnosticWarn = { fg = colors.yellow },
	DiagnosticInfo = { fg = colors.blue },
	DiagnosticHint = { fg = colors.teal },
	DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
	DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
	DiagnosticUnderlineInfo = { sp = colors.blue, undercurl = true },
	DiagnosticUnderlineHint = { sp = colors.teal, undercurl = true },

	-- Status and Tab Line
	StatusLine = { fg = colors.text, bg = colors.mantle },
	StatusLineNC = { fg = colors.overlay1, bg = colors.mantle },
	TabLine = { fg = colors.surface1, bg = colors.mantle },
	TabLineSel = { fg = colors.text, bg = colors.surface0 },
	TabLineFill = { bg = colors.mantle },

	-- Git
	DiffAdd = { bg = colors.surface0, fg = colors.green },
	DiffChange = { bg = colors.surface0, fg = colors.yellow },
	DiffDelete = { bg = colors.surface0, fg = colors.red },
	DiffText = { bg = colors.surface0, fg = colors.blue },

	-- Misc
	MatchParen = { bg = colors.surface2 },
	NonText = { fg = colors.surface2 },
	SpecialKey = { fg = colors.surface2 },
	Folded = { fg = colors.blue, bg = colors.surface0 },
	FoldColumn = { fg = colors.overlay0, bg = colors.base },
	WildMenu = { bg = colors.surface0 },
	Directory = { fg = colors.blue },
	Title = { fg = colors.blue, bold = true },
	Bold = { bold = true },
	Italic = { italic = true },
}

-- Apply highlights
for group, settings in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, settings)
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
