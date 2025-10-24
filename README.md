# colorscheme-picker.nvim

A simple and elegant colorscheme picker for Neovim with live preview support.

## ✨ Features

- 🎨 Three built-in colorschemes (dark-void, muted-catppuccin, rose-pine)
- 🔍 Multiple picker interfaces (simple, telescope, interactive preview)
- ⚡ Live theme preview
- 🎯 Easy theme registration
- ⌨️ Default keymaps included
- 🔌 Zero dependencies (telescope optional)

## 📋 Requirements

- Neovim >= 0.8.0
- Optional: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (for telescope picker interface)

## 📦 Installation

### With [lazy.nvim](https://github.com/folke/lazy.nvim)

**Minimal setup (auto-loads with defaults on VimEnter):**

```lua
{
  "artyultra/colorscheme-picker.nvim",
}
```

**Recommended setup with telescope:**

```lua
{
  "artyultra/colorscheme-picker.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" }, -- Optional
  lazy = false, -- Load on startup
  priority = 1000, -- Load before other plugins
  config = function()
    require("colorscheme-picker").setup({
      default_theme = "dark-void", -- Set default theme on startup
      enable_default_keymaps = true, -- Enable default keybindings
      telescope = true, -- Enable telescope integration
      persist_theme = true, -- Remember last selected theme
    })
  end,
}
```

**Full lazy.nvim configuration example:**

```lua
{
  "artyultra/colorscheme-picker.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  lazy = false,
  priority = 1000,
  config = function()
    require("colorscheme-picker").setup({
      default_theme = "dark-void",
      enable_default_keymaps = true,
      telescope = true,
      persist_theme = true,
      persist_path = vim.fn.stdpath("data") .. "/colorscheme-picker.json",

      -- Add your own custom themes
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
  requires = { "nvim-telescope/telescope.nvim" }, -- Optional
  config = function()
    require("colorscheme-picker").setup()
  end
}
```

### Manual Installation

Clone this repository into your Neovim plugin directory:

```bash
git clone https://github.com/artyultra/colorscheme-picker.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/colorscheme-picker.nvim
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
| `<leader>th` | `:ColorschemePickerTelescope` | Open telescope picker    |
| `<leader>cl` | `:ColorschemeList`            | List all themes          |

> **Note:** Default keymaps can be disabled by setting `enable_default_keymaps = false` in setup.

## 🎨 Built-in Themes

1. **dark-void** - Dark minimal theme with green accents
2. **muted-catppuccin** - Muted version of Catppuccin Mocha
3. **rose-pine** - Minimal Rose Pine inspired theme

## ⚙️ Configuration

### Default Settings

The following are the default settings when you call `setup()`:

```lua
{
  default_theme = nil,           -- No theme applied on startup (nil means use persisted theme if available)
  enable_default_keymaps = true, -- Enable default keybindings
  telescope = true,              -- Enable telescope integration
  persist_theme = true,          -- Remember and restore the last selected theme
  persist_path = vim.fn.stdpath("data") .. "/colorscheme-picker.json", -- Where theme preference is saved
  themes = {},                   -- Custom themes to register
}
```

### Configuration Options

| Option                   | Type       | Default                                                 | Description                                                          |
| ------------------------ | ---------- | ------------------------------------------------------- | -------------------------------------------------------------------- |
| `default_theme`          | `string`   | `nil`                                                   | Theme to apply on startup. Takes priority over persisted theme      |
| `enable_default_keymaps` | `boolean`  | `true`                                                  | Enable/disable default keybindings                                   |
| `telescope`              | `boolean`  | `true`                                                  | Enable telescope picker (requires telescope.nvim)                    |
| `persist_theme`          | `boolean`  | `true`                                                  | Remember last selected theme across sessions                         |
| `persist_path`           | `string`   | `vim.fn.stdpath("data") .. "/colorscheme-picker.json"` | File path where theme preference is saved                            |
| `themes`                 | `table`    | `{}`                                                    | Custom themes to register (key = theme name, value = theme function) |

### Example Configurations

**Minimal setup (uses all defaults):**

```lua
require("colorscheme-picker").setup()
```

**Custom theme on startup:**

```lua
require("colorscheme-picker").setup({
  default_theme = "rose-pine",
})
```

**Disable keymaps and persistence:**

```lua
require("colorscheme-picker").setup({
  enable_default_keymaps = false,
  persist_theme = false,
})
```

**Full custom configuration:**

```lua
require("colorscheme-picker").setup({
  default_theme = "dark-void",
  enable_default_keymaps = true,
  telescope = true,
  persist_theme = true,
  persist_path = vim.fn.stdpath("data") .. "/my-colorscheme.json",

  -- Register custom themes
  themes = {
    custom_theme = function()
      vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
      vim.g.colors_name = "custom_theme"
    end,
  },
})
```

> **Note:** If no `default_theme` is specified and `persist_theme = true`, the plugin will automatically restore your last selected theme.

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
