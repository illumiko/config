local M = {}
M.config = {}
M.lazy = {}


M.config = {
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 5, -- spacing between columns
		align = "center", -- align columns left, center or right
	},
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	window = {
		border = "none",
		position = "bottom",
        margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
    plugins = {
        presets = {
            operators = false
        }
    }
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
}
M.lazy = {
	"folke/which-key.nvim",
    config = M.config
}
return M.lazy
