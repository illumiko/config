return {
	-- [[#Dependencies]]
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
		config = function()
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
		end,
	}, -- }}}

	--[[#Completion]]
	"hrsh7th/cmp-nvim-lsp", --cmp source lsp
	"hrsh7th/cmp-nvim-lua", --cmp source nvim lua
	"hrsh7th/cmp-buffer", --cmp source buffer
	"hrsh7th/cmp-path", --cmp source path
	"hrsh7th/cmp-cmdline", --cmp source cmd
	"hrsh7th/nvim-cmp", --base of cmp
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"saadparwaiz1/cmp_luasnip", --for snippets
	"onsails/lspkind-nvim", --customizing cmp

	--[[#Snippets]]
	"rafamadriz/friendly-snippets",
	"L3MON4D3/LuaSnip",

	--[[#Bufferline]]
	"romgrk/barbar.nvim",

	--[[#status bar]]
	"tjdevries/express_line.nvim",

	--[[#Utility]]
	"David-Kunz/markid",
	"kazhala/close-buffers.nvim",
	"anuvyklack/fold-preview.nvim",
	"fgheng/winbar.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"xiyaowong/nvim-transparent",
	"matze/vim-move",
	-- "Pocco81/AutoSave.nvim",
	"andweeb/presence.nvim",
	"windwp/nvim-ts-autotag",
	"romainl/vim-devdocs",
	"Pocco81/HighStr.nvim",
	"osyo-manga/vim-over",
	"jghauser/mkdir.nvim",
	"mg979/vim-visual-multi",
	"folke/which-key.nvim",
	{ url = "https://gitlab.com/yorickpeterse/nvim-window.git" },
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	-- "SmiteshP/nvim-navic",
	"haringsrob/nvim_context_vt",
	"anuvyklack/fold-preview.nvim",

	{ -- {{{

		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup({ width = 95 })
		end,
	},
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
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	},
	"p00f/nvim-ts-rainbow",
	{
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{
		"ghillb/cybu.nvim",
		branch = "main", -- timely updates
		-- branch = "v1.x", -- won't receive breaking changes
	},
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	}, -- }}}

	--[[#Markdown Preview]]
	"ellisonleao/glow.nvim",

	--[[#File Browser]]
	{ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },

	--[[#Note talking/Scheduling etc]]
	"nvim-neorg/neorg",
	{
		"dhruvasagar/vim-table-mode",
		ft = "norg",
	},

	-- [[nvim greeter]]
	"goolord/alpha-nvim",

	--[[#Syntax/Treesitter]]
	"nvim-treesitter/nvim-treesitter-context",
	"nvim-treesitter/nvim-treesitter",
	"nvim-treesitter/playground",

	--[[#session]]
	"tpope/vim-obsession",

	--[[#git]]
	"lewis6991/gitsigns.nvim",

	--[terminal]]
	"akinsho/toggleterm.nvim",

	--[[#Telescope]]
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	}, -- session picker

	--[[#colorscheme]]
	"sainnhe/everforest",
	"RRethy/nvim-base16",
	"atelierbram/Base2Tone-nvim",
	"rockerBOO/boo-colorscheme-nvim",
	"RishabhRD/gruvy",
	"glepnir/zephyr-nvim",
	"kvrohit/rasmus.nvim",
	"mcchrish/zenbones.nvim",
	"rmehri01/onenord.nvim",
	-- {'olimorris/onedarkpro.nvim'}, -- onedarkpro
	{ "rebelot/kanagawa.nvim" }, -- kangawa}}}
	"sainnhe/everforest",
}
