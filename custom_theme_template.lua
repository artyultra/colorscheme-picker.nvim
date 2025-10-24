-- Custom Theme Template for colorscheme-picker.nvim
-- Copy this file and customize the colors to create your own theme
--
-- Usage:
-- 1. Copy this file to your custom themes directory
-- 2. Rename it (e.g., my_awesome_theme.lua)
-- 3. Customize the colors below
-- 4. Set custom_themes_path in your setup() to point to the directory
--
-- Highlight Attributes:
--   fg       - foreground color (hex: "#rrggbb")
--   bg       - background color (hex: "#rrggbb" or "NONE")
--   sp       - special/underline color (hex: "#rrggbb")
--   bold     - bold text (boolean)
--   italic   - italic text (boolean)
--   underline - underlined text (boolean)
--   undercurl - curly underline (boolean)
--   strikethrough - strikethrough text (boolean)
--   reverse  - reverse fg/bg (boolean)

return function()
	-- Define your color palette
	local colors = {
		-- Base colors
		fg = "#c0c0c0",           -- Main foreground color
		bg = "#1c1c1c",           -- Main background color

		-- UI colors
		cursor = "#bdfe58",       -- Cursor color
		line_nr = "#404040",      -- Line number color
		visual = "#303030",       -- Visual selection background
		comment = "#585858",      -- Comment color
		border = "#585858",       -- Border color
		eob = "#3c3c3c",          -- End of buffer (~) color

		-- Syntax colors
		string = "#d1d1d1",       -- String literals
		func = "#e1e1e1",         -- Function names
		kw = "#f1f1f1",           -- Keywords (if, for, etc.)
		identifier = "#b1b1b1",   -- Variables
		type = "#a1a1a1",         -- Types (int, class, etc.)
		operator = "#1bfd9c",     -- Operators (+, -, etc.)
		bracket = "#e6e6e6",      -- Brackets, delimiters
		preprocessor = "#6a7a8a", -- Preprocessor directives
		constant = "#b2d8d8",     -- Constants
		bool = "#66b2b2",         -- Booleans

		-- Search
		search = "#1bfd9c",       -- Search highlight color

		-- Git
		added = "#baffc9",        -- Git added lines
		changed = "#ffffba",      -- Git modified lines
		removed = "#ffb3ba",      -- Git removed lines

		-- Diagnostics (LSP)
		error = "#dea6a0",        -- Error messages
		warning = "#d6efd8",      -- Warning messages
		hint = "#bedc74",         -- Hint messages
		info = "#7fa1c3",         -- Info messages

		-- Popups
		pmenu_bg = "#1c1c1c",     -- Popup menu background
		pmenu_sel = "#1bfd9c",    -- Popup menu selected item

		-- Misc
		title = "#bdfe58",        -- Titles
	}

	-- Define highlight groups
	local highlights = {
		-- ═══════════════════════════════════════════════════════════
		-- EDITOR UI
		-- ═══════════════════════════════════════════════════════════
		Normal = { fg = colors.fg, bg = colors.bg },                 -- Normal text
		NormalFloat = { fg = colors.fg, bg = colors.bg },            -- Normal text in floating windows
		NormalNC = { fg = colors.fg, bg = colors.bg },               -- Normal text in non-current windows

		-- Cursor
		Cursor = { fg = colors.bg, bg = colors.cursor },             -- Character under cursor
		CursorLine = { bg = "NONE" },                                -- Current line highlight
		CursorLineNr = { fg = colors.cursor, bold = true },          -- Line number on cursor line
		CursorColumn = { bg = colors.visual },                       -- Current column highlight

		-- Line Numbers & Signs
		LineNr = { fg = colors.line_nr },                            -- Line numbers
		SignColumn = { bg = "NONE" },                                -- Sign column (git signs, diagnostics)
		FoldColumn = { fg = colors.line_nr },                        -- Fold column

		-- Visual Selection
		Visual = { bg = colors.visual, bold = true },                -- Visual mode selection
		VisualNOS = { bg = colors.visual },                          -- Visual mode selection (not owning selection)

		-- Splits & Borders
		VertSplit = { fg = colors.border },                          -- Vertical split separator (legacy)
		WinSeparator = { fg = colors.border },                       -- Window separator
		FloatBorder = { fg = colors.border },                        -- Floating window border

		-- Misc UI
		ColorColumn = { bg = colors.visual },                        -- Color column (set with :set colorcolumn)
		Whitespace = { fg = colors.comment },                        -- Whitespace characters
		EndOfBuffer = { fg = colors.eob },                           -- ~ lines at end of buffer
		MatchParen = { fg = colors.constant, bold = true },          -- Matching parentheses
		Title = { fg = colors.title, bold = true },                  -- Titles

		-- ═══════════════════════════════════════════════════════════
		-- SYNTAX HIGHLIGHTING
		-- ═══════════════════════════════════════════════════════════
		Comment = { fg = colors.comment, italic = true },            -- Comments

		-- Constants
		Constant = { fg = colors.constant },                         -- Any constant
		String = { fg = colors.string },                             -- String literals
		Character = { fg = colors.string },                          -- Character literals
		Number = { fg = colors.constant },                           -- Number literals
		Boolean = { fg = colors.bool },                              -- Boolean literals
		Float = { fg = colors.constant },                            -- Floating point literals

		-- Identifiers
		Identifier = { fg = colors.identifier },                     -- Variable names
		Function = { fg = colors.func },                             -- Function names

		-- Statements
		Statement = { fg = colors.kw },                              -- Any statement
		Conditional = { fg = colors.kw },                            -- if, else, switch
		Repeat = { fg = colors.kw },                                 -- for, while, loop
		Label = { fg = colors.kw },                                  -- case, default
		Operator = { fg = colors.operator },                         -- Operators: +, -, *, /
		Keyword = { fg = colors.kw },                                -- Any other keyword
		Exception = { fg = colors.kw },                              -- try, catch, throw

		-- Preprocessor
		PreProc = { fg = colors.preprocessor },                      -- Generic preprocessor
		Include = { fg = colors.preprocessor },                      -- #include, import
		Define = { fg = colors.preprocessor },                       -- #define
		Macro = { fg = colors.preprocessor },                        -- Macros
		PreCondit = { fg = colors.preprocessor },                    -- #if, #else, #endif

		-- Types
		Type = { fg = colors.type },                                 -- int, long, char
		StorageClass = { fg = colors.type },                         -- static, register, volatile
		Structure = { fg = colors.type },                            -- struct, union, enum
		Typedef = { fg = colors.type },                              -- typedef

		-- Special
		Special = { fg = colors.bracket },                           -- Special characters
		SpecialChar = { fg = colors.bracket },                       -- Special chars in string
		Tag = { fg = colors.kw },                                    -- HTML/XML tags
		Delimiter = { fg = colors.bracket },                         -- Delimiters: (), [], {}
		SpecialComment = { fg = colors.comment, italic = true },     -- Special comments
		Debug = { fg = colors.constant },                            -- Debug statements

		-- Error & Todo
		Error = { fg = colors.error, bold = true },                  -- Errors
		Todo = { fg = colors.bg, bg = colors.warning, bold = true }, -- TODO, FIXME, NOTE

		-- ═══════════════════════════════════════════════════════════
		-- SEARCH & REPLACE
		-- ═══════════════════════════════════════════════════════════
		Search = { bg = colors.search, fg = colors.bg },             -- Last search pattern
		IncSearch = { bg = colors.search, fg = colors.bg },          -- Incremental search
		CurSearch = { bg = colors.search, fg = colors.bg },          -- Current search match
		Substitute = { bg = colors.changed, fg = colors.bg },        -- :substitute preview

		-- ═══════════════════════════════════════════════════════════
		-- POPUP MENUS (COMPLETION)
		-- ═══════════════════════════════════════════════════════════
		Pmenu = { fg = colors.fg, bg = colors.pmenu_bg },            -- Popup menu normal item
		PmenuSel = { fg = colors.bg, bg = colors.pmenu_sel },        -- Popup menu selected item
		PmenuSbar = { bg = colors.visual },                          -- Popup menu scrollbar
		PmenuThumb = { bg = colors.line_nr },                        -- Popup menu scrollbar thumb

		-- ═══════════════════════════════════════════════════════════
		-- DIAGNOSTICS (LSP)
		-- ═══════════════════════════════════════════════════════════
		DiagnosticError = { fg = colors.error },                     -- Error diagnostic
		DiagnosticWarn = { fg = colors.warning },                    -- Warning diagnostic
		DiagnosticInfo = { fg = colors.info },                       -- Info diagnostic
		DiagnosticHint = { fg = colors.hint },                       -- Hint diagnostic

		DiagnosticUnderlineError = { sp = colors.error, underline = true },   -- Error underline
		DiagnosticUnderlineWarn = { sp = colors.warning, underline = true },  -- Warning underline
		DiagnosticUnderlineInfo = { sp = colors.info, underline = true },     -- Info underline
		DiagnosticUnderlineHint = { sp = colors.hint, underline = true },     -- Hint underline

		DiagnosticVirtualTextError = { fg = colors.error },          -- Virtual text for errors
		DiagnosticVirtualTextWarn = { fg = colors.warning },         -- Virtual text for warnings
		DiagnosticVirtualTextInfo = { fg = colors.info },            -- Virtual text for info
		DiagnosticVirtualTextHint = { fg = colors.hint },            -- Virtual text for hints

		-- ═══════════════════════════════════════════════════════════
		-- GIT / DIFF
		-- ═══════════════════════════════════════════════════════════
		DiffAdd = { fg = colors.added },                             -- Added lines
		DiffChange = { fg = colors.changed },                        -- Changed lines
		DiffDelete = { fg = colors.removed },                        -- Deleted lines
		DiffText = { bg = colors.changed },                          -- Changed text within line

		-- Git Signs (plugin support)
		GitSignsAdd = { fg = colors.added },                         -- Git added
		GitSignsChange = { fg = colors.changed },                    -- Git changed
		GitSignsDelete = { fg = colors.removed },                    -- Git deleted

		-- ═══════════════════════════════════════════════════════════
		-- TREESITTER
		-- ═══════════════════════════════════════════════════════════
		-- Modern syntax highlighting via Treesitter
		-- (Most will inherit from the standard groups above)

		["@comment"] = { link = "Comment" },
		["@error"] = { link = "Error" },
		["@operator"] = { link = "Operator" },
		["@keyword"] = { link = "Keyword" },
		["@keyword.function"] = { link = "Keyword" },
		["@keyword.return"] = { link = "Keyword" },
		["@function"] = { link = "Function" },
		["@function.builtin"] = { link = "Function" },
		["@variable"] = { link = "Identifier" },
		["@variable.builtin"] = { link = "Identifier" },
		["@string"] = { link = "String" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@constant"] = { link = "Constant" },
		["@type"] = { link = "Type" },
		["@type.builtin"] = { link = "Type" },

		-- ═══════════════════════════════════════════════════════════
		-- STATUSLINE & TABLINE
		-- ═══════════════════════════════════════════════════════════
		StatusLine = { fg = colors.fg, bg = colors.bg },             -- Active statusline
		StatusLineNC = { fg = colors.line_nr, bg = colors.bg },      -- Inactive statusline
		TabLine = { fg = colors.line_nr, bg = colors.bg },           -- Inactive tab
		TabLineFill = { bg = colors.bg },                            -- Tabline fill
		TabLineSel = { fg = colors.fg, bg = colors.visual },         -- Active tab

		-- ═══════════════════════════════════════════════════════════
		-- SPELL CHECKING
		-- ═══════════════════════════════════════════════════════════
		SpellBad = { sp = colors.error, undercurl = true },          -- Misspelled word
		SpellCap = { sp = colors.warning, undercurl = true },        -- Word should be capitalized
		SpellLocal = { sp = colors.info, undercurl = true },         -- Word from another region
		SpellRare = { sp = colors.hint, undercurl = true },          -- Rare word

		-- ═══════════════════════════════════════════════════════════
		-- FOLDS
		-- ═══════════════════════════════════════════════════════════
		Folded = { fg = colors.comment, bg = colors.visual },        -- Folded lines

		-- ═══════════════════════════════════════════════════════════
		-- MESSAGES & PROMPTS
		-- ═══════════════════════════════════════════════════════════
		ModeMsg = { fg = colors.fg },                                -- Mode message (-- INSERT --)
		MoreMsg = { fg = colors.info },                              -- More prompt
		MsgArea = { fg = colors.fg },                                -- Message area
		Question = { fg = colors.info },                             -- Questions/prompts
		ErrorMsg = { fg = colors.error },                            -- Error messages
		WarningMsg = { fg = colors.warning },                        -- Warning messages
	}

	-- Apply all highlight groups
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end

	-- Set the colorscheme name (change this to match your theme name)
	vim.g.colors_name = "custom_theme"
end
