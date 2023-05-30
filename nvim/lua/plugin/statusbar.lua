local M = {}

config = function()
	-- local get_bg = require("utils.get_hl").get_hl
	require("staline").setup({
		-- sections = {
		-- 	left = { ("▁"):rep(vim.o.columns) }, -- change thickness: "_", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
		-- 	mid = {},
		-- 	right = {},
		-- },
		mode_colors = {
			n = "#569cd6",
			i = "#80ad6b",
			v = "#264f78",
			c = "#d7ba7d",
			t = "#d7ba7d",
		},
	})
	require("stabline").setup({
		-- style = "slant",
		bg = "#444444",
		-- stab_right = "|",
	})
end

M.lazy = {
	"tamton-aquib/staline.nvim",
	config = config,
}
return M.lazy
