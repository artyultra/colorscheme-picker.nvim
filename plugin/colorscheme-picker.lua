-- Only load once
if vim.g.loaded_colorscheme_picker then
	return
end
vim.g.loaded_colorscheme_picker = 1

-- Auto-setup with defaults if user doesn't call setup
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		-- Check if setup was already called
		if not vim.g.colorscheme_picker_setup_called then
			require("colorscheme-picker").setup()
			vim.g.colorscheme_picker_setup_called = true
		end
	end,
	once = true,
})
