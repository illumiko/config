function transparent()-- {{{
	local transparent = { "VertSplit", "FloatBorder", "WinSeparator", "LspInlayHint" }
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
-- ts-rainbow consistant colors
--[[ for index, value in pairs(ts_rainbow) do
	-- vim.cmd("hi link rainbowcol" .. index .. " " .. value)
end ]]
