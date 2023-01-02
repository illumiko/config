return {
	-- [[#Dependencies]]
	"winston0410/cmd-parser.nvim",
	"anuvyklack/keymap-amend.nvim",
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"MunifTanjim/nui.nvim",
	"rktjmp/lush.nvim",
	"nvim-lua/popup.nvim",

	-- [[#LSP]]
	"neovim/nvim-lspconfig", --lsp base
	"williamboman/nvim-lsp-installer", --auto lsp installer
	"tami5/lspsaga.nvim", -- nightly
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
	"folke/neodev.nvim",
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
	{
		"tjdevries/express_line.nvim",
		events = { "BufEnter" },
	},

	--[[#Utility]]

	{ "anuvyklack/fold-preview.nvim" },
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
		keys = { { "<leader>w", ":lua require('nvim-window').pick()<CR>", desc = "window picker" } },
	},
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	-- "SmiteshP/nvim-navic",
	"winston0410/range-highlight.nvim",
	"numToStr/Navigator.nvim",
	"rhysd/accelerated-jk",
	-- {{{,
	-- {
	-- 	"nkakouros-original/numbers.nvim",
	-- 	config = function()
	-- 		require("numbers").setup({
	-- 			exclude_filetypes = { "alpha", "toggleterm", "TelescopePrompt", "neo-tree" },
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-zh/colorful-winsep.nvim",
		config = function()
			require("colorful-winsep").setup()
		end,
	},

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
			},
			{
				"<leader>bdn",
				[[<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>]],
				desc = "Nameless bufdel",
			},
			{
				"<leader>bdd",
				[[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]],
				desc = "Current bufdel",
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
			{ "f", ":HopWordCurrentLine<CR>", desc = "Line hop" },
			{ "F", ":HopChar1CurrentLine<CR>", desc = "Char hop" },
			{ "<leader>hl", ":HopLine<CR>", desc = "Line Hop" },
			{ "<leader>hc", ":HopChar1<CR>", desc = "Char Hop" },
			{ "<leader>hw", ":HopWord<CR>", desc = "Word Hop" },
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

	--[[#File Browser]]
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		keys = {
			{ "<Leader>e", ":NeoTreeFocusToggle<CR>", desc = "Explorer" },
		},
	},

	--[[#Note talking/Scheduling etc]]
	{ "nvim-neorg/neorg", ft = "norg" },
	{
		"dhruvasagar/vim-table-mode",
		ft = "norg",
	},

	-- [[nvim greeter]]
	{ "goolord/alpha-nvim", lazy = true },

	--[[#Syntax/Treesitter]]
	{
		"nvim-treesitter/nvim-treesitter",
		events = { "BufEnter" },
		build = "TSUpdate",
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
		keys = {
			{
				"<C-\\>",
				function()
					local path = vim.fn.expand("%:p:h")
					return vim.cmd(vim.v.count .. " ToggleTerm dir=" .. path)
				end,
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
				"<leader>fc",
				"<cmd>lua require('telescope.builtin').find_files({cwd='~/.config/'})<CR>",
				desc = "Config Files",
			},
			{
				"<leader>ff",
				":Telescope find_files theme=ivy<CR>",
				desc = "Find Files",
			},
			{
				"<leader>fb",
				":Telescope file_browser<CR>",
				desc = "File Browser",
			},
			{
				"<leader>fo",
				":Telescope oldfiles<CR>jk",
				desc = "Old Files",
			},
			{
				"<leader>fg",
				"<cmd>lua require('telescope.builtin').live_grep()<CR>",
				desc = "Grep Directory",
			},
			{
				"<S-Tab>",
				":lua require('telescope.builtin').buffers()<CR>",
				desc = "Buffer Picker",
			},
		}, -- }}}
		dependencies = {
			"nvim-telescope/telescope-file-browser.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			}, -- session picker
		},
	},

	--[[#colorscheme]]
	{ "sainnhe/everforest", lazy = true },
	{ "RishabhRD/gruvy", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "navarasu/onedark.nvim", lazy = true },
	-- "glepnir/zephyr-nvim",
	{ "catppuccin/nvim", name = "catppuccin", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true }, -- kangawa}}}
}
