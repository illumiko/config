local M = {}
local config = {}
config.mdcodeblock = {
	hl_group = "MDCodeBlock", -- default highlight group
	events = { -- refresh event
		"FileChangedShellPost",
		"Syntax",
		"TextChanged",
		"TextChangedI",
		"InsertLeave",
		"WinScrolled",
		"BufEnter",
	},
	padding_right = 4, -- always append 4 space at lineend
	timer_delay = 20, -- refresh delay(ms)
	query_by_ft = { -- special parser query by filetype
		markdown = { -- filetype
			"markdown", -- parser
			"(fenced_code_block) @codeblock", -- query
		},
		rmd = { -- filetype
			"markdown", -- parser
			"(fenced_code_block) @codeblock", -- query
		},
	},
	minumum_len = 100, -- minimum len to highlight (number | function)
	-- minumum_len = function () return math.max(math.f
}

M.lazy = {
	{ "jghauser/follow-md-links.nvim" },
	{ "yaocccc/nvim-hl-mdcodeblock.lua", config = config.mdcodeblock ,ft="norg"},
	{
		"nfrid/markdown-togglecheck",
		dependencies = { "nfrid/treesitter-utils" },
	},
}
return M.lazy
