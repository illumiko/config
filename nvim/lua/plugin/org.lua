require("neorg").setup({
	-- Tell Neorg what modules to load
	load = {
		["core.defaults"] = {}, -- Load all the default modules
		["core.export"] = {-- {{{
			config = {
				extensions = "all",
			},
		},-- }}}
		["core.norg.completion"] = {-- {{{
			config = {
				engine = "nvim-cmp", -- We current support nvim-compe and nvim-cmp only
			},
		},-- }}}
		["core.keybinds"] = {-- {{{
			config = {
				default_keybinds = true,
				neorg_leader = "<Leader>o",
			},
		},-- }}}
		["core.norg.journal"] = {-- {{{
			config = { -- Note that this table is optional and doesn't need to be provided
				-- Configuration here
                workspace = "default",
				jornal_folder = "./gtd/journal",
				strategy = "flat",
			},
		},-- }}}
		["core.norg.concealer"] = {}, -- Allows for use of icons
		["core.norg.dirman"] = { -- Manage your directories with Neorg{{{
			config = {
				workspaces = {
					default = "/home/illumiko/Documents/norg/gtd",
                    example_gtd = "~/Documents/norg/practice/example_workspaces/gtd/"
				},
				autochdir = true, -- Automatically change the directory to the current workspace's root every time
				index = "index.norg", -- The name of the main (root) .norg file
                open_last_workspace = true
			},
		},-- }}}
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
})

--for completion
