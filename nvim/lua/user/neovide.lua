vim.opt.guifont = { "VictorMono Nerd Font", ":h14" }

vim.g.neovide_transparency = 0.95
vim.g.neovide_scale_factor = 0.85
vim.g.neovide_floating_blur_amount_x = 20.0
vim.g.neovide_floating_blur_amount_y = 0.0
vim.g.neovide_input_use_logo = true -- true on macOS

vim.opt.laststatus = 3
vim.opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})


require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = true,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = false,
})

vim.cmd("hi IndentBlanklineChar guifg=none")
vim.cmd("colorscheme gruvbox")
require("user.highlights")
