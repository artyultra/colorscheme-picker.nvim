# colorscheme-picker.nvim

A simple and elegant colorscheme picker for Neovim with live preview support.

## ✨ Features

- 🎨 Three built-in colorschemes (dark-void, muted-catppuccin, rose-pine)
- 🔍 Multiple picker interfaces (simple, telescope, interactive preview)
- ⚡ Live theme preview
- 🎯 Easy theme registration
- ⌨️ Default keymaps included
- 🔌 Zero dependencies (telescope optional)

## 📦 Installation

### With [lazy.nvim](https://github.com/folke/lazy.nvim)

**Basic setup (auto-loads with defaults):**

```lua
{
  "artyultra/colorscheme-picker.nvim",
}
```

**With configuration:**

```lua
{
  "artyultra/colorscheme-picker.nvim",
  config = function()
    require("colorscheme-picker").setup({
      default_theme = "dark-void", -- Set default theme
      enable_default_keymaps = true, -- Enable <leader>cs, <leader>cp, etc.
      telescope = true, -- Enable telescope integration

      -- Add your own themes
      themes = {
        my_theme = function()
          vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
          vim.g.colors_name = "my_theme"
        end,
      },
    })
  end,
}
```

### With [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "artyultra/colorscheme-picker.nvim",
  config = function()
    require("colorscheme-picker").setup()
  end
}
```

## 🚀 Usage

### Commands

- `:ColorschemePicker` - Open simple picker
- `:ColorschemePickerTelescope` - Open telescope picker (requires telescope.nvim)
- `:ColorschemePreview` - Open interactive preview with j/k navigation
- `:ColorschemeList` - List all available themes
- `:Colorscheme <name>` - Apply specific theme (with tab completion)

### Default Keymaps

| Key          | Command                       | Description              |
| ------------ | ----------------------------- | ------------------------ |
| `<leader>cs` | `:ColorschemePicker`          | Open simple picker       |
| `<leader>cp` | `:ColorschemePreview`         | Open interactive preview |
| `<leader>ct` | `:ColorschemePickerTelescope` | Open telescope picker    |
| `<leader>cl` | `:ColorschemeList`            | List all themes          |

## 🎨 Built-in Themes

1. **dark-void** - Dark minimal theme with green accents
2. **muted-catppuccin** - Muted version of Catppuccin Mocha
3. **rose-pine** - Minimal Rose Pine inspired theme

## 🔧 Configuration

```lua
require("colorscheme-picker").setup({
  -- Set default theme on startup
  default_theme = "dark-void",

  -- Enable default keymaps (<leader>cs, <leader>cp, etc.)
  enable_default_keymaps = true,

  -- Enable telescope integration
  telescope = true,

  -- Register additional themes
  themes = {
    custom_theme = function()
      -- Your theme code here
      vim.g.colors_name = "custom_theme"
    end,
  },
})
```

## 📝 Adding Custom Themes

### Method 1: In setup

```lua
require("colorscheme-picker").setup({
  themes = {
    my_theme = function()
      vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
      -- ... more highlights
      vim.g.colors_name = "my_theme"
    end,
  },
})
```

### Method 2: Register after setup

```lua
local picker = require("colorscheme-picker")

picker.register_theme("my_theme", function()
  vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
  vim.g.colors_name = "my_theme"
end)
```

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## 📄 License

MIT License
