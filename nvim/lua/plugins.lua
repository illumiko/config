return {
	-- [[#Dependencies]]
	"winston0410/cmd-parser.nvim",
	"anuvyklack/keymap-amend.nvim",
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	"rktjmp/lush.nvim",
	"nvim-lua/popup.nvim",
	"godlygeek/tabular",

	-- [[#LSP]]
	"neovim/nvim-lspconfig", --lsp base
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"lvimuser/lsp-inlayhints.nvim",
	{ -- {{{"ahmedkhalf/project.nvim",
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	}, -- }}}
	{ -- {{{"j-hui/fidget.nvim",
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	}, -- }}}
	{ "mhartington/formatter.nvim" },
	"RRethy/vim-illuminate",
	{ -- {{{ "rmagatti/goto-preview",
		"rmagatti/goto-preview",
		config = function() -- {{{
			require("goto-preview").setup({
				width = 100, -- Width of the floating window
				height = 20, -- Height of the floating window
				border = "single", -- Border characters of the floating window
				default_mappings = false, -- Bind default mappings
				debug = false, -- Print debug information
				opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
				resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
				post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
				-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
				focus_on_open = true, -- Focus the floating window when opening it.
				dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
				force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
				bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
			})
		end, -- }}}
		keys = { -- {{{
			{
				"gD",
				":lua require('goto-preview').goto_preview_definition()<cr>",
				silent = true,
				desc = "Preview Definition",
				noremap = true,
			},
			{
				"gI",
				":lua require('goto-preview').goto_preview_implementation()<cr>",
				silent = true,
				desc = "Preview Implementation",
			},
			{ "gc", ":lua require('goto-preview').close_all_win()<cr>", silent = true, desc = "Close Preview" },
			{
				"gR",
				":lua require('goto-preview').goto_preview_references()<cr>",
				silent = true,
				desc = "Preview References",
			},
		}, -- }}}
	}, -- }}}
	--[[Nvim config]]
	-- "folke/neodev.nvim",

	--#firevim

	{
		"glacambre/firenvim",

		-- Lazy load firenvim
		-- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
		cond = not not vim.g.started_by_firenvim,
		build = function()
			require("lazy").load({ plugins = "firenvim", wait = true })
			vim.fn["firenvim#install"](0)
		end,
	},

	-- #winbar
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {
			-- configurations go here
		},
	},

	--[[#Completion]]
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", --cmp source lsp
			"hrsh7th/cmp-nvim-lua", --cmp source nvim lua
			"hrsh7th/cmp-buffer", --cmp source buffer
			"hrsh7th/cmp-path", --cmp source path
			"hrsh7th/cmp-cmdline", --cmp source cmd
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"saadparwaiz1/cmp_luasnip", --for snippets
			"onsails/lspkind-nvim", --customizing cmp
		},
	}, --base of cmp

	--[[#Snippets]]
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},

	--[[#Bufferline]]
	{ "romgrk/barbar.nvim", lazy = true },

	--[[#status bar]]
	--[[ {
		"tjdevries/express_line.nvim",
		events = { "BufEnter" },
	}, ]]
	--[[ {
		"nvim-lualine/lualine.nvim",
		events = { "BufEnter" },
	}, ]]

	{ "tamton-aquib/staline.nvim", events = { "BufEnter" } },

	--[[#Utility]]
	-- { "mvllow/modes.nvim" },
	{
		"cpea2506/relative-toggle.nvim",
		config = function()
			require("relative-toggle").setup({
				pattern = "*",
				events = {
					on = { "CmdlineLeave" },
					off = { "CmdlineEnter" },
				},
			})
		end,
	},
	"wellle/targets.vim", -- better surround motions
	"lukas-reineke/indent-blankline.nvim",
	-- "xiyaowong/nvim-transparent",
	"matze/vim-move",
	-- "Pocco81/AutoSave.nvim",
	"romainl/vim-devdocs",
	"osyo-manga/vim-over",
	"jghauser/mkdir.nvim",
	"mg979/vim-visual-multi",
	"folke/which-key.nvim",
	{
		url = "https://gitlab.com/yorickpeterse/nvim-window.git",
		keys = {
			{
				"<leader>w",
				":lua require('nvim-window').pick()<CR>",
				desc = "window picker",
				silent = true,
				noremap = true,
			},
		},
	},
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	-- "SmiteshP/nvim-navic",
	"winston0410/range-highlight.nvim",
	"numToStr/Navigator.nvim",
	"rhysd/accelerated-jk",
	-- {{{,
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

	--[[ { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" }, ]]
	{
		"echasnovski/mini.animate",
		config = function()
			require("mini.animate").setup({ resize = { enable = false }, scroll = { enable = true } })
		end,
	},
	-- {
	-- 	"nkakouros-original/numbers.nvim",
	-- 	config = function()
	-- 		require("numbers").setup({
	-- 			exclude_filetypes = { "alpha", "toggleterm", "TelescopePrompt", "neo-tree" },
	-- 		})
	-- 	end,
	-- },
	{
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	},
	{
		"kazhala/close-buffers.nvim",
		keys = {
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
		},
	},
	--[[ {
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup({ width = 95 })
		end,
	}, ]]
	{
		"lewis6991/impatient.nvim",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
		keys = {
			-- { "f", ":HopWordCurrentLine<CR>", desc = "Line hop", noremap = true, silent = true },
			-- { "F", ":HopChar1CurrentLine<CR>", desc = "Char hop", noremap = true, silent = true },
			{ "<leader>hl", ":HopLine<CR>", desc = "Line Hop", noremap = true, silent = true },
			{ "<leader>hc", ":HopChar1<CR>", desc = "Char Hop", noremap = true, silent = true },
			{ "<leader>hw", ":HopWord<CR>", desc = "Word Hop", noremap = true, silent = true },
		},
	},
	-- {
	-- 	"ghillb/cybu.nvim",
	-- 	branch = "main", -- timely updates
	-- 	-- branch = "v1.x", -- won't receive breaking changes
	-- },
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	}, -- }}}

	--[[#Markdown Preview]]
	{ "ellisonleao/glow.nvim" },
	{ "corriander/vim-markdown-indent", ft = "markdown" },

	--[[#File Browser]]
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		keys = {
			{ "<Leader>E", ":Neotree toggle<CR>", desc = "Explorer", silent = true, noremap = true },
		},
	},
	--[[#Note talking/Scheduling etc]]
	-- [[NORG]]
	-- { "nvim-neorg/neorg", ft = "norg" },
	{ "NFrid/due.nvim", ft = "norg" },
	{ "tpope/vim-speeddating" },
	{
		"dhruvasagar/vim-table-mode",
		ft = "norg",
	},
	{ "lervag/vimtex" },

	-- [[nvim greeter]]
	{ "goolord/alpha-nvim", lazy = true },

	--[[#Syntax/Treesitter]]
	{
		"nvim-treesitter/nvim-treesitter",
		events = { "BufEnter" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/playground",
			"haringsrob/nvim_context_vt",
			"windwp/nvim-ts-autotag",
			"p00f/nvim-ts-rainbow",
			"David-Kunz/markid",
			{
				"lewis6991/spellsitter.nvim",
				config = function()
					require("spellsitter").setup()
				end,
			},
		},
	},

	--[[#session]]
	"tpope/vim-obsession",

	--[[#git]]
	"lewis6991/gitsigns.nvim",

	--[terminal]]
	{
		"akinsho/toggleterm.nvim",
		events = "BufNew",
		keys = {
			{
				"<C-\\>",
				function()
					local path = vim.fn.expand("%:p:h")
					return vim.cmd(vim.v.count .. " ToggleTerm dir=" .. path)
				end,
				silent = true,
				noremap = true,
				desc = "",
			},
		},
	},

	--[[#Telescope]]
	{
		"nvim-telescope/telescope.nvim",
		keys = { -- {{{
			{
				"<leader>fp",
				"<cmd>lua require('telescope.builtin').find_files({cwd='~/Documents/Projects/'})<CR>",
				desc = "Project Files",
			},
			{
				"<leader>fd",
				"<cmd>lua require('telescope.builtin').find_files({cwd='~/Dotfiles/'})<CR>",
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
		}, -- }}}
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			}, -- session picker
		},
	},

	--[[#colorscheme]]
	{ "NTBBloodbath/doom-one.nvim", lazy = true },
	{ "sainnhe/everforest", lazy = true },
	{ "RishabhRD/gruvy", lazy = true },
	{ "mcchrish/zenbones.nvim", lazy = true },
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	{ "gbprod/nord.nvim", lazy = true },
	-- "glepnir/zephyr-nvim",
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true }, -- kangawa}}}
	{ "tiagovla/tokyodark.nvim", lazy = true },
	{ "metalelf0/jellybeans-nvim", lazy = true },
}
