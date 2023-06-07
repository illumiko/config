local M = {}
local config = {
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.export"] = { -- {{{
			config = {
				extensions = "all",
			},
		}, -- }}}
		["core.completion"] = { -- {{{
			config = {
				engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
			},
		}, -- }}}
		["core.keybinds"] = { -- {{{
			config = {
				default_keybinds = true,
				neorg_leader = "<Leader>o",
			},
		}, -- }}}
		["core.journal"] = { -- {{{
			config = { -- Note that this table is optional and doesn't need to be provided
				-- Configuration here
				workspace = "default",
				jornal_folder = "./gtd/journal",
				strategy = "flat",
			},
		}, -- }}}
		["core.concealer"] = {
			config = {
				icon_preset = "diamond",
				-- width = "content",
			},
		}, -- Allows for use of icons
		["core.dirman"] = { -- Manage your directories with Neorg{{{
			config = {
				workspaces = {
					default = "/home/illumiko/Documents/norg/",
				},
				autochdir = false, -- Automatically change the directory to the current workspace's root every time
				index = "index.norg", -- The name of the main (root) .norg file
				open_last_workspace = false,
			},
		}, -- }}}
		--[[ ["core.gtd.base"] = {-- {{{
			config = {
                workspace = "example_gtd",
				default_lists = {
					inbox = "inbox.norg",
				},
				syntax = {
					context = "#contexts",
					start = "#time.start",
					due = "#time.due",
					waiting = "#waiting.for",
				},
				displayers = {
					projects = {
						show_completed_projects = true,
						show_projects_without_tasks = true,
					},
				},
				exclude = {
					"journal",
					"progress",
                    "notes",
                    "random_stuff",
                    "personal_confessions"
				},
				custom_tag_completion = true,
			},
		},-- }}} ]]
	},
}
M.lazy = {
	{ "nvim-neorg/neorg", config = config, commit="f9ec5c4" },
	{ "NFrid/due.nvim", ft = "norg" },
	{ "tpope/vim-speeddating" },
	{
		"dhruvasagar/vim-table-mode",
		ft = "norg",
	},

}
return M.lazy

