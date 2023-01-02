vim.opt.guifont = {"VictorMono NFM", ":h12"}
vim.cmd("let g:neovide_scale_factor = 0.85")

--kanagawa
-- {{{
require("kanagawa").setup({
	undercurl = true, -- enable undercurls
    functionStyle = {},
	commentStyle = {},
	keywordStyle = { bold = true },
	statementStyle = { bold = true },
	typeStyle = { bold = true,},
	variablebuiltinStyle = {},
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	colors = {},
	overrides = {},
	globalStatus = true,
})
vim.cmd([=[

colorscheme kanagawa
hi link CmpPmenu Normal
]=])
-- }}}
