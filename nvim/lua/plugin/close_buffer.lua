local M = {}
M.config = {
	filetype_ignore = {}, -- Filetype to ignore when running deletions
	file_glob_ignore = {}, -- File name glob pattern to ignore when running deletions (e.g. '*.md')
	file_regex_ignore = {}, -- File name regex pattern to ignore when running deletions (e.g. '.*[.]md')
	preserve_window_layout = { "this", "nameless" }, -- Types of deletion that should preserve the window layout
	next_buffer_cmd = nil, -- Custom function to retrieve the next buffer when preserving window layout
}
M.keys = {
	{
		"<leader>bdh",
		[[<CMD>lua require('close_buffers').delete({type = 'hidden'})<CR>]],
		desc = "Hidden bufdel",
		silent = true,
		noremap = true,
	},
	{
		"<leader>bdn",
		[[<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>]],
		desc = "Nameless bufdel",
		silent = true,
		noremap = true,
	},
	{
		"<leader>bdd",
		[[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]],
		desc = "Current bufdel",
		silent = true,
		noremap = true,
	},
}
M.lazy = {
	"kazhala/close-buffers.nvim",
	keys = M.keys,
	config = M.config,
}
return M.lazy
