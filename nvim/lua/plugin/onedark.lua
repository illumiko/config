local onedarkpro = require('onedarkpro')
onedarkpro.setup({
  theme = "onedark", -- The theme to be used (opts: 'onedark' or 'onelight')
  colors = {}, -- Override default colors
  hlgroups = {}, -- Override default highlight groups
  styles = {
      strings = "NONE", -- Style that is applied to strings
      comments = "italic", -- Style that is applied to comments
      keywords = "italic", -- Style that is applied to keywords
      functions = "italic", -- Style that is applied to functions
      variables = "bold", -- Style that is applied to variables
  },
  options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = true, -- Use the themes opinionated underline styles?
      undercurl = true, -- Use the themes opinionated undercurl styles?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      highlight_cursorline = false, -- Use cursorline highlighting?
  }
})
require('onedarkpro').load()
