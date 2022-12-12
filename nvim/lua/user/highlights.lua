vim.cmd([[
hi VertSplit guibg=none guifg=none
hi FloatBorder guibg=none guifg=none
hi WinSeparator guibg=none guifg=none
hi TelescopeBorder guibg=none
hi LspInlayHint guibg=none
]])
-- Get zephyr color
--[[ local z = require("zephyr")
local colors = { -- {{{
	z.yellow,
	z.red,
	z.orange,
	z.light_orange,
	z.cyan,
	z.blue,
	z.violet,
	z.magenta,
	z.teal,
	z.redwine,
	z.yellow,
	z.dark_green,
	z.grey,
	z.violet,
	z.blue,
	z.cyan,
	z.red,
	z.teal,
	z.yellow,
	z.magenta,
	z.dark_green,
	z.violet,
	z.blue,
	z.yellow,
	z.red,
	z.orange,
	z.cyan,
	z.light_orange,
} -- }}}
local hl_group = { -- {{{
	"NavicIconsFile",
	"NavicIconsModule",
	"NavicIconsNamespace",
	"NavicIconsPackage",
	"NavicIconsClass",
	"NavicIconsMethod",
	"NavicIconsProperty",
	"NavicIconsField",
	"NavicIconsConstructor",
	"NavicIconsEnum",
	"NavicIconsInterface",
	"NavicIconsFunction",
	"NavicIconsVariable",
	"NavicIconsConstant",
	"NavicIconsString",
	"NavicIconsNumber",
	"NavicIconsBoolean",
	"NavicIconsArray",
	"NavicIconsObject",
	"NavicIconsKey",
	"NavicIconsNull",
	"NavicIconsEnumMember",
	"NavicIconsStruct",
	"NavicIconsEvent",
	"NavicIconsOperator",
	"NavicIconsTypeParameter",
	"NavicText",
	"NavicSeparator",
} -- }}}
for key, value in pairs(hl_group) do
    print(key,value)
	vim.cmd("hi " .. value .. " guifg=" .. colors[key])
	-- vim.api.nvim_set_hl(0, value, { default = false, bg = colors[key], fg = colors[key] })
end ]]
