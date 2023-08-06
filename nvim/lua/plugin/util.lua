return {
	"winston0410/cmd-parser.nvim",
	"anuvyklack/keymap-amend.nvim",
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	"rktjmp/lush.nvim",
	"nvim-lua/popup.nvim",
	"godlygeek/tabular",
	"wellle/targets.vim", -- better surround motions
	"matze/vim-move",
	"lewis6991/impatient.nvim",

	{
		"max397574/colortils.nvim",
		cmd = "Colortils",
		config = function()
			require("colortils").setup()
		end,
	},

	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			require("mini.surround").setup()
		end,
	},

	{
		-- "echasnovski/mini.animate",
		-- config = function()
		-- 	require("mini.animate").setup({ resize = { enable = false }, scroll = { enable = true } })
		-- end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},

	{
		"mvllow/modes.nvim",
		config = function()
			require("modes").setup({
				line_opacity = 0.30,
			})
		end,
	},

	{ "shortcuts/no-neck-pain.nvim", version = "*" },

	{
		"andweeb/presence.nvim",
		config = function()
			-- The setup config table shows all available config options with their default values:
			require("presence"):setup({
				-- General options
				auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
				main_image = "file", -- Main image display (either "neovim" or "file")
				client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
				log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout = 100, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number = false, -- Displays the current line number instead of the current project
				blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				show_time = false, -- Show the timer

				-- Rich Presence text options
				editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				-- plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				-- reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
			})
		end,
	},

	-- {
	-- 	"phaazon/hop.nvim",
	-- 	as = "hop",
	-- 	config = function()
	-- 		require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
	-- 	end,
	-- 	keys = {
	-- 		-- { "f", ":HopWordCurrentLine<CR>", desc = "Line hop", noremap = true, silent = true },
	-- 		-- { "F", ":HopChar1CurrentLine<CR>", desc = "Char hop", noremap = true, silent = true },
	-- 		{ "<leader>hl", ":HopLine<CR>", desc = "Line Hop", noremap = true, silent = true },
	-- 		{ "<leader>hc", ":HopChar1<CR>", desc = "Char Hop", noremap = true, silent = true },
	-- 		{ "<leader>hw", ":HopWord<CR>", desc = "Word Hop", noremap = true, silent = true },
	-- 	},
	-- },
}
