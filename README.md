# colorscheme-picker.nvim

A simple colorscheme picker for Neovim with live preview and persistence.

## Features

- Three built-in themes (dark-void, muted-catppuccin, rose-pine)
- Multiple picker interfaces (simple, telescope, interactive preview)
- Live theme preview
- Theme persistence across sessions
- Easy custom theme registration
- Default keymaps included

## Requirements

- Neovim >= 0.8.0
- Optional: [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for telescope picker

## Installation

### lazy.nvim

```lua
{
  "artyultra/colorscheme-picker.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" }, -- Optional
  lazy = false,
  priority = 1000,
  config = function()
    require("colorscheme-picker").setup({
      -- See configuration options below
    })
  end,
}
```

### packer.nvim

```lua
use {
  "artyultra/colorscheme-picker.nvim",
  requires = { "nvim-telescope/telescope.nvim" }, -- Optional
  config = function()
    require("colorscheme-picker").setup({
      -- See configuration options below
    })
  end
}
```

## Usage

### Commands

| Command                        | Description                          |
| ------------------------------ | ------------------------------------ |
| `:ColorschemePicker`           | Open simple picker                   |
| `:ColorschemePickerTelescope`  | Open telescope picker                |
| `:ColorschemePreview`          | Interactive preview (j/k navigation) |
| `:ColorschemeList`             | List all available themes            |
| `:Colorscheme <name>`          | Apply specific theme (tab complete)  |

### Default Keymaps

| Key          | Command                       |
| ------------ | ----------------------------- |
| `<leader>cs` | Open simple picker            |
| `<leader>cp` | Open interactive preview      |
| `<leader>th` | Open telescope picker         |
| `<leader>cl` | List all themes               |

Disable with `enable_default_keymaps = false`.

## Configuration

All options are optional. Defaults shown below:

| Option                   | Type      | Default                                                    | Description                                    |
| ------------------------ | --------- | ---------------------------------------------------------- | ---------------------------------------------- |
| `default_theme`          | `string`  | `nil`                                                      | Theme to apply on startup                      |
| `enable_default_keymaps` | `boolean` | `true`                                                     | Enable default keybindings                     |
| `telescope`              | `boolean` | `true`                                                     | Enable telescope picker                        |
| `persist_theme`          | `boolean` | `true`                                                     | Remember last selected theme                   |
| `persist_path`           | `string`  | `vim.fn.stdpath("data") .. "/colorscheme-picker.json"`    | Where theme preference is saved                |
| `custom_themes_path`     | `string`  | `vim.fn.stdpath("config") .. "/lua/custom/core/themes/"`  | Directory to load custom theme files from      |
| `themes`                 | `table`   | `{}`                                                       | Custom themes (name = function)                |

### Examples

**Minimal (use defaults):**
```lua
require("colorscheme-picker").setup()
```

**Set default theme:**
```lua
require("colorscheme-picker").setup({
  default_theme = "rose-pine",
})
```

**With custom theme:**
```lua
require("colorscheme-picker").setup({
  default_theme = "dark-void",
  themes = {
    my_theme = function()
      vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
      vim.g.colors_name = "my_theme"
    end,
  },
})
```

## Adding Custom Themes

See `custom_theme_template.lua` for a comprehensive template with all Vim highlight groups and detailed comments.

**During setup:**
```lua
require("colorscheme-picker").setup({
  themes = {
    my_theme = function()
      vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
      vim.g.colors_name = "my_theme"
    end,
  },
})
```

**After setup:**
```lua
require("colorscheme-picker").register_theme("my_theme", function()
  vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff", bg = "#000000" })
  vim.g.colors_name = "my_theme"
end)
```

## Built-in Themes

- **dark-void** - Dark minimal theme with green accents
- **muted-catppuccin** - Muted Catppuccin Mocha
- **rose-pine** - Minimal Rose Pine inspired

## License

MIT
