local M = {}

config = function()
	-- local get_bg = require("utils.get_hl").get_hl
	require("staline").setup({
		sections = {
			left = { ("▁"):rep(vim.o.columns) }, -- change thickness: "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
			mid = {},
			right = {},
		},
		mode_colors = {
			n = "#986fec",
			i = "#e86671",
			v = "#e27d60",
			c = "#e86671",
		},
	})
	require("stabline").setup({
		style = "slant",
		-- bg = "#444444",
		stab_right = "",
	})
end

M.lazy = {
	"tamton-aquib/staline.nvim",
	config = config,
}
return M.lazy
