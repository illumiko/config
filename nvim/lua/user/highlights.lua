local transparent = function ()-- {{{
	local transparent = { "VertSplit", "FloatBorder","NormalFloat", "WinSeparator", "LspInlayHint", "IndentBlanklineSpaceChar" }
	for _, value in pairs(transparent) do
		vim.cmd("hi " .. value .. " guibg=none guifg=none")
	end
end-- }}}
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
