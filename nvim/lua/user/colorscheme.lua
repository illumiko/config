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
-- {{{
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
	keywordStyle = { italic = true, bold = true },
	statementStyle = { bold = true },
	typeStyle = { bold = true },
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	colors = {},
	overrides = {},
	globalStatus = true,
})
vim.cmd("colorscheme kanagawa")
-- }}}
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
