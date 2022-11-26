-- Rasmus
--[[ -- {{{
vim.api.nvim_command([=[
colorscheme rasmus
hi BufferVisible guibg=#444444 guifg=#666666
hi BufferVisibleSign guibg=#444444 guifg=#666666
hi BufferVisibleIndex guibg=#444444 guifg=#666666
hi PmenuSel guibg=#7bb099
hi LspReferenceRead guibg=#4b4b49 guifg=none
hi LspReferenceText guibg=#4b4b49 guifg=none
hi LspReferenceWrite guibg=#4b4b49 guifg=none
hi CmpItemKindSnippet guifg=#7bb099
hi CmpItemKindText guifg=#d1d1d1
hi CmpItemKindKeyword guifg=#ffc591
hi NormalNc guibg=#16181c
]=])-- }}} ]]
-- Kanagawa
--[[ -- {{{
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
require("kanagawa").setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { bold = true, italic = true },
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = { bold = true, italic = true },
	variablebuiltinStyle = {},
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	colors = {},
	overrides = {},
	globalStatus = true,
})
vim.cmd("colorscheme kanagawa")
-- }}} ]]
-- Zyphyr
--[[ -- {{{
vim.api.nvim_command([=[
colorscheme zephyr
hi NormalNc guibg=#16181c
]=])-- }}} ]]
-- Everforest
--[[ -- {{{
vim.api.nvim_command([=[
colorscheme everforest
hi Normal guibg=none
hi NormalNc guibg=#16181c
]=])-- }}} ]]
-- Boo
--[[ -- {{{
require("boo-colorscheme").use({
	theme = "crimson_moonlight",
	italic = true,
})
vim.cmd([=[
hi LspReferenceRead  guibg=#3f3442 guifg=none
hi LspReferenceText  guibg=#3f3442 guifg=none
hi LspReferenceWrite guibg=#3f3442 guifg=none
]=])
-- }}} ]]
-- one nord
--[[ -- {{{
require("onenord").setup({
	theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
	borders = true, -- Split window borders
	fade_nc = true, -- Fade non-current windows, making them more distinguishable
	-- Style that is applied to various groups: see `highlight-args` for options
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "italic",
		functions = "bold,italic",
		variables = "NONE",
		diagnostics = "underline",
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	-- Inverse highlight for different groups
	inverse = {
		match_paren = true,
	},
	custom_highlights = {}, -- Overwrite default highlight groups
	custom_colors = {}, -- Overwrite default colors
})
-- }}} ]]
vim.cmd([=[
colorscheme base16-gruvbox-dark-hard
hi NormalNC guibg=#111111
]=])

