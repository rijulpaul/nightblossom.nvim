# 🌸 Nightblossom 🌸

<img src="https://raw.githubusercontent.com/rijulpaul/nightblossom.nvim/refs/heads/assets/transparent.png" />

**Bring the brightness of spring to your editor!**

A beautiful, vibrant Neovim colorscheme inspired by spring blossoms with a soft, dreamy aesthetic.

>This theme is a Neovim port of [RustedTurnip's night-blossom](https://github.com/RustedTurnip/night-blossom) VSCode theme, bringing the same spring-inspired aesthetic to Neovim.

---

## 🌈 **Theme Variants**

Nightblossom comes with multiple built-in variants:

- **🩷 Spring** (default) Original vibrant spring colors
<img src="https://raw.githubusercontent.com/rijulpaul/nightblossom.nvim/refs/heads/assets/classic.png" />

`:colorscheme nightblossom`

- **🌸 Sakura** Cherry blossom inspired, warm pink tones
<img src="https://raw.githubusercontent.com/rijulpaul/nightblossom.nvim/refs/heads/assets/sakura.png" />

`:colorscheme nightblossom-sakura`

- **💮 Pastel** Soft, muted colors for gentle viewing
<img src="https://raw.githubusercontent.com/rijulpaul/nightblossom.nvim/refs/heads/assets/pastel.png" />

`:colorscheme nightblossom-pastel`

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "rijulpaul/nightblossom.nvim",
  name = "nightblossom",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme nightblossom")
  end,
}
```

### Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "rijulpaul/nightblossom.nvim",
  as = "nightblossom",
  config = function()
    vim.cmd("colorscheme nightblossom")
  end
}
```

### Using [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'rijulpaul/nightblossom.nvim'
colorscheme nightblossom
```


## 🔧 Configuration

### **Basic Usage**

```lua
-- Default spring variant
vim.cmd("colorscheme nightblossom")

-- Or use specific variants
vim.cmd("colorscheme nightblossom-sakura")
vim.cmd("colorscheme nightblossom-pastel")
```

### **Advanced Configuration**

```lua
-- Setup with configuration options
require("nightblossom").setup({
  variant = "spring",              -- "spring", "sakura", "pastel"
  transparent = false,             -- Enable background transparency
  integrations = {
    treesitter = true,             -- TreeSitter highlighting
  },

  -- Override system for custom colors and highlights
  overrides = {
    colors = {
      bg = "#000015",              -- Custom background color
      fg = "#ffffff",              -- Custom foreground color
      red = "#ff4444",             -- Custom red accent
    },
    highlights = {
      Normal = { bg = "#1a1a1a", fg = "#e0e0e0" },
      ["@comment"] = { fg = "#888888", italic = false },
    }
  }
})
```

### **Override System**

Nightblossom provides a powerful override system that allows you to customize both colors and highlights without modifying the source code.

#### **Get Color Palette**

Get the current palette, each color and its hex code.

```lua
-- Get a table of current palette
local palette = require("nightblossom").get_palette()

for name, hl in pairs(palette) do
    print(name .. " : " .. hl)
end
```

#### **Color Overrides**

Override specific colors in the palette:

```lua
-- Override specific colors
require("nightblossom").override_colors({
  bg = "#0a0a0a",      -- Darker background
  fg = "#ffffff",      -- Pure white foreground
  red = "#ff4444",     -- Brighter red
  green = "#44ff44",   -- Brighter green
  purple = "#a855f7",  -- Custom purple
})
```

#### **Highlight Overrides**

Override specific highlight groups:

```lua
-- Override specific highlights
require("nightblossom").override_highlights({
  Normal = {
    bg = "#1a1a1a",
    fg = "#e0e0e0",
  },
  Comment = {
    fg = "#888888",
    italic = true,
    bold = true,
  },
  Function = {
    fg = "#ff6b6b",
    bold = true,
  },
  String = {
    fg = "#ffaa00",
    bold = true,
  },
})
```

#### **Dynamic Overrides**

Change colors and highlights on the fly:

```lua
-- Make theme darker
local function make_darker()
  require("nightblossom").override_colors({
    bg = "#000000",
    bg_alt = "#0a0a0a",
    fg = "#cccccc",
  })
end

-- Apply high contrast theme
local function apply_high_contrast()
  require("nightblossom").override_highlights({
    Normal = { bg = "#000000", fg = "#ffffff" },
    Comment = { fg = "#888888", italic = true },
    String = { fg = "#ffaa00", bold = true },
    Function = { fg = "#00aaff", bold = true },
  })
end
```

#### **Plugin-Specific Overrides**

Customize highlights for specific plugins:

```lua
-- Telescope overrides
require("nightblossom").override_highlights({
  TelescopeBorder = { fg = "#ff6b6b", bg = "#1a1a1a" },
  TelescopeSelection = { bg = "#2a2a2a", bold = true },
})

-- LSP overrides
require("nightblossom").override_highlights({
  LspDiagnosticsError = { fg = "#ff4444", bold = true },
  LspDiagnosticsWarning = { fg = "#ffaa00", bold = true },
})

-- Git overrides
require("nightblossom").override_highlights({
  GitSignsAdd = { fg = "#44ff44" },
  GitSignsChange = { fg = "#ffaa00" },
  GitSignsDelete = { fg = "#ff4444" },
})
```

#### **Filetype-Specific Overrides**

Apply different overrides for different filetypes:

```lua
-- Python-specific overrides
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    require("nightblossom").override_highlights({
      Function = { fg = "#ff6b6b", bold = true },
      Keyword = { fg = "#4ec9b0", bold = true },
    })
  end,
})

-- JavaScript-specific overrides
vim.api.nvim_create_autocmd("FileType", {
  pattern = "javascript",
  callback = function()
    require("nightblossom").override_highlights({
      Function = { fg = "#61dafb", bold = true },
      Keyword = { fg = "#ff6b6b", bold = true },
    })
  end,
})
```

#### **Managing Overrides**

Clear and manage your overrides:

```lua
-- Clear all overrides
require("nightblossom").clear_all_overrides()

-- Clear specific override types
require("nightblossom").clear_color_overrides()     -- Only clear color overrides
require("nightblossom").clear_highlight_overrides() -- Only clear highlight overrides

-- Get current overrides
local current_colors = require("nightblossom").get_color_overrides()
local current_highlights = require("nightblossom").get_highlight_overrides()
```

### **Programmatic Switching**

```lua
-- Switch variants programmatically
require("nightblossom").set_variant("sakura")

-- Get available variants
local variants = require("nightblossom").get_variants()
print("Available:", table.concat(variants, ", "))
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Related Projects

- **VSCode:** [night-blossom by RustedTurnip](https://github.com/RustedTurnip/night-blossom) - The original VSCode theme
- **Neovim:** This project - Nightblossom for Neovim

---

**Made with 🌸 by [rijulpaul](https://github.com/rijulpaul)**
