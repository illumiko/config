local u = require("utils.get_hl")
local transparent = function() -- {{{
	local transparent =
		{ "VertSplit", "FloatBorder", "NormalFloat","Folded", "WinSeparator", "LspInlayHint", "IndentBlanklineSpaceChar" }
	for _, value in pairs(transparent) do
		vim.cmd("hi " .. value .. " guibg=none guifg=none")
	end
end -- }}}
local ts_rainbow = {
	"@debug",
	"@define",
	"@function.macro",
	"@variable",
	"@method",
	"@label",
	"@character",
}

transparent()

-- Change folded guifg
u.set_hl_fg("Folded","Comment")


require("modes").setup({ -- {{{
	colors = {
		copy = u.get_hl("Visual", "background"),
		delete = u.get_hl("Error", "foreground"),
		insert = u.get_hl("String", "foreground"),
		visual = u.get_hl("Visual", "background"),
	},

	-- Set opacity for cursorline and number background
	line_opacity = 0.25,

	-- Enable cursor highlights
	set_cursor = true,

	-- Enable cursorline initially, and disable cursorline for inactive windows
	-- or ignored filetypes
	set_cursorline = false,

	-- Enable line number highlights to match cursorline
	set_number = true,

	-- Disable modes highlights in specified filetypes
	-- Please PR commonly ignored filetypes
	ignore_filetypes = { "neo-tree", "alpha", "NvimTree", "TelescopePrompt" },
}) -- }}}
