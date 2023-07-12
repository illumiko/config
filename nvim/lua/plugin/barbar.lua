local M = {}
vim.g.barbar_auto_setup = false -- disable auto-setup
local config = {
	animation = false,
	auto_hide = false,
	tabpages = true,
	clickable = false,
	-- Excludes buffers from the tabline
	exclude_ft = {},
	exclude_name = {},
	icons = {
		filetype = { enabled = true },
		button = "",
		modified = {
			button = "●",
		},
		inactive = {
			separator = {
				left = "▎",
			},
		},
		separator = {
			left = "▎",
		},
	},
	icon_custom_colors = false, maximum_padding = 1,
	maximum_length = 30,
	semantic_letters = true,
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	no_name_title = nil,
}
M.lazy = {
	"romgrk/barbar.nvim",
	config = config,
}

return M.lazy
