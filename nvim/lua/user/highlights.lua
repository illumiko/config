local u = require("utils.get_hl")
local transparent = function() -- {{{
	local transparent = {
		"VertSplit",
		"FloatBorder",
		"NormalFloat",
		"Folded",
		"WinSeparator",
		"LspInlayHint",
		"IndentBlanklineSpaceChar",
        --Telescope stuff:
        "TelescopeBorder",
        "TelescopeResultsBorder",
        "TelescopePreviewBorder",
        "TelescopePromptBorder",
        "TelescopeTitle",
        "TelescopeResultsTitle",
        "TelescopePreviewTitle",
        "TelescopePromptTitle",
        "TelescopeNormal"
	}

	for _, value in pairs(transparent) do
		vim.cmd("hi " .. value .. " guibg=none guifg=none")
	end
end -- }}}
local ts_rainbow = { -- {{{
	"@debug",
	"@define",
	"@function.macro",
	"@variable",
	"@method",
	"@label",
	"@character",
} -- }}}

transparent() -- setting hi's to none
u.set_hl_fg("Folded", "Comment") -- Change folded guifg
u.set_hl_bg("ScrollbarCursor", "Visual") -- Change scroll bar guibg

--[[ require("modes").setup({ -- {{{
	colors = {
		copy = u.get_hl("Visual", "background"),
		delete = u.get_hl("Error", "foreground"),
		insert = u.get_hl("String", "foreground"),
		visual = u.get_hl("Visual", "background"),
	},

	-- Set opacity for cursorline and number background
	line_opacity = 0,

	-- Enable cursor highlights
	set_cursor = true,

	-- Enable cursorline initially, and disable cursorline for inactive windows
	-- or ignored filetypes
	set_cursorline = true,

	-- Enable line number highlights to match cursorline
	set_number = true,

	-- Disable modes highlights in specified filetypes
	-- Please PR commonly ignored filetypes
	ignore_filetypes = { "neo-tree", "alpha", "NvimTree", "TelescopePrompt" },
}) -- }}} ]]
-- {{{ Conceals
vim.cmd([[
    if exists('g:no_vim_conceal') || !has('conceal') || &enc != 'utf-8'
        finish
    endif
    
    " math related
    syntax match pyOperator " / " conceal cchar=÷
    syntax match pyOperator " \* " conceal cchar=×
    syntax match pyOperator "\<\%(math\.\)\?sqrt\>" conceal cchar=√
    syntax match pyOperator "\<\%(math\.\)\?prod\>" conceal cchar=∏
    syntax match pyOperator "\( \|\)\*\*\( \|\)2\>" conceal cchar=²
    syntax match pyOperator "\( \|\)\*\*\( \|\)3\>" conceal cchar=³
    " keywords
    syntax keyword pyOperator product conceal cchar=∏
    syntax keyword pyOperator sum conceal cchar=∑
    syntax keyword pyStatement lambda conceal cchar=ﬦ
    hi link pyOperator Operator
    hi link pyStatement Statement
    hi link pyKeyword Keyword
    hi! link Conceal Operator
    setlocal conceallevel=2
]])

-- }}}
