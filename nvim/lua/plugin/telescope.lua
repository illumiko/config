local M = {}
local config = function()
	local actions = require("telescope.actions")
	local status_ok, telescope = pcall(require, "telescope")
	if not status_ok then
		return
	end
	telescope.setup({
		defaults = {
			layout_strategies = cursor,
			prompt_prefix = " ",
			selection_caret = " ",
			path_display = { "smart" },
			mappings = {
				n = {
					["q"] = actions.close,
				},
			},
		},
		autotag = { enable = true },
		rainbow = {
			enable = true,
			termcolors = {
				rainbowcol1 = "Debug",
			},
		},
		pickers = { -- {{{
			find_files = {
				theme = "ivy",
			},
			buffers = {
				theme = "dropdown",
			},
			spell_suggest = {
				theme = "cursor",
			},
		}, -- }}}
		extensions = { -- {{{
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
			file_browser = {
				theme = "ivy",
				-- disables netrw and use telescope-file-browser in its place
				hijack_netrw = true,
			},
		}, -- }}}
	})
	telescope.load_extension("fzf")
	telescope.load_extension("file_browser")
end
keys = {
	{
		"<leader>fp",
		"<cmd>lua require('telescope.builtin').find_files({cwd='~/Documents/Projects/'})<CR>",
		desc = "Project Files",
	},
	{
		"<leader>fd",
		"<cmd>lua require('telescope.builtin').find_files({cwd='~/dotfiles/'})<CR>",
		desc = "Config Files",
		silent = true,
	},
	{
		"<leader>ff",
		":Telescope find_files theme=ivy<CR>",
		desc = "Find Files",
		silent = true,
	},
	{
		"<leader>e",
		":Telescope file_browser path=%:p:h select_buffer=true<CR>",
		desc = "File Browser",
		silent = true,
	},
	{
		"<leader>fo",
		":Telescope oldfiles theme=ivy<CR>",
		desc = "Old Files",
		silent = true,
	},
	{
		"<leader>fg",
		"<cmd>lua require('telescope.builtin').live_grep()<CR>",
		desc = "Grep Directory",
		silent = true,
	},
	{
		"<S-Tab>",
		":lua require('telescope.builtin').buffers()<CR>",
		desc = "Buffer Picker",
		silent = true,
	},
	{
		"<leader>a",
		":Telescope spell_suggest<CR>",
		desc = "Spell Suggest",
		silent = true,
	},
}

M.lazy = {
	"nvim-telescope/telescope.nvim",
	config = config,
	keys = keys,
	dependencies = {
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- session picker
	},
}
return M.lazy
