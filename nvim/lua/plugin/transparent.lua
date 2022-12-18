local transparent = true
require("transparent").setup({
	enable = transparent, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups
		-- example of akinsho/nvim-bufferline.lua
		"all",
		"BufferLineTabClose",
        "CmpPmenu",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
	exclude = {}, -- table: groups you don't want to clear
})
if transparent == true then
    vim.cmd("hi link CmpPmenu Normal")
end
