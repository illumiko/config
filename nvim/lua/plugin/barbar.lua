local M = {}
vim.g.barbar_auto_setup = false -- disable auto-setup
local config = {
	-- WARN: do not copy everything below into your config!
	--       It is just an example of what configuration options there are.
	--       The defaults are suitable for most people.

	-- Enable/disable animations
	animation = true,

	-- Enable/disable auto-hiding the tab bar when there is a single buffer
	auto_hide = true,

	-- Enable/disable current/total tabpages indicator (top right corner)
	tabpages = true,

	-- Enables/disable clickable tabs
	--  - left-click: go to buffer
	--  - middle-click: delete buffer
	clickable = true,

	-- Excludes buffers from the tabline
	-- A buffer to this direction will be focused (if it exists) when closing the current buffer.
	-- Valid options are 'left' (the default) and 'right'
	focus_on_close = "left",

	-- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
	hide = { extensions = true, inactive = false },
	-- Disable highlighting alternate buffers
	highlight_alternate = false,

	-- Disable highlighting file icons in inactive buffers
	highlight_inactive_file_icons = false,

	-- Enable highlighting visible buffers
	highlight_visible = true,

	-- If true, new buffers will be inserted at the start/end of the list.
	-- Default is to insert after current buffer.
	insert_at_end = true,

	-- Sets the maximum padding width with which to surround each tab
	maximum_padding = 1,

	-- Sets the minimum padding width with which to surround each tab
	minimum_padding = 1,

	-- Sets the maximum buffer name length.
	maximum_length = 30,

	-- Sets the minimum buffer name length.
	minimum_length = 0,

	-- If set, the letters for each buffer in buffer-pick mode will be
	-- assigned based on their name. Otherwise or in case all letters are
	-- already assigned, the behavior is to assign letters in order of
	-- usability (see order below)
	semantic_letters = true,

	-- Set the filetypes which barbar will offset itself for
	-- New buffer letters are assigned in this order. This order is
	-- optimal for the qwerty keyboard layout but might need adjustment
	-- for other layouts.
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",

	-- Sets the name of unnamed buffers. By default format is "[Buffer X]"
	-- where X is the buffer number. But only a static string is accepted here.
	no_name_title = nil,
}

M.lazy = {
	"romgrk/barbar.nvim",
    config = config
}

return M.lazy
