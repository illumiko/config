----------------------------------------------
--
--[[PLUGINS]]
----------------------------------------------
local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall 
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	--[[neoscroll]]
	use({
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
				hide_cursor = false, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
				performance_mode = false, -- Disable "Performance Mode" on all buffers.
			})
		end,
	})
	--[[nvim ide like folds]]
	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	--[[scoped tabs]]
	use({
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	})
	--[[highlight text]]
	use("Pocco81/HighStr.nvim")
	--[[GLow .md preview]]
	use({
		"ellisonleao/glow.nvim",
		branch = "main",
		config = function()
			require("glow").setup({
				style = "dark",
				border = "none",
				width = 120,
				paper = true,
			})
		end,
	})
	--[[Create directory that dont exist with :w]]
	use({ "jghauser/mkdir.nvim" })
	--[[cursorline highlight acc to mode]]
	use({
		"mvllow/modes.nvim",
		config = function()
			require("modes").setup({
				colors = {
					copy = "#ffc591",
					delete = "#d1d1d1",
					insert = "#7bb099",
					visual = "#9bc6e9",
				},
			})
		end,
	})
	use({ "matze/vim-move" })
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
	})
	--[[advance spell checker]]
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})
	--[[function context]]
	use({ "https://github.com/haringsrob/nvim_context_vt" })
	--[[transparent nvim]]
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				enable = false, -- boolean: enable transparent
				extra_groups = { -- table/string: additional groups that should be cleared
					-- In particular, when you set it to 'all', that means all available groups
					-- example of akinsho/nvim-bufferline.lua
					"BufferLineTabClose",
					"BufferlineBufferSelected",
					"BufferLineFill",
					"BufferLineBackground",
					"BufferLineSeparator",
					"BufferLineIndicatorSelected",
				},
				exclude = {}, -- table: groups you don't want to clear
			})
		end,
	})
	use({
		"lewis6991/impatient.nvim",
		lock = true,
		config = {
			-- Move to lua dir so impatient.nvim can cache it
			compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		},
	})
	use({
		"wbthomason/packer.nvim",
		lock = true,
	})
	--[[multi cursor]]
	use({ "mg979/vim-visual-multi" })
	--[[whcich Key]]
	use({
		"folke/which-key.nvim",
		lock = true,
	})

	--[[window picker]]
	use({
		"https://gitlab.com/yorickpeterse/nvim-window.git",
		config = function() --{{{
			vim.cmd([[hi BlackOnLightYellow guifg=#000000 guibg=#f2de91]])
			require("nvim-window").setup({
				-- The characters available for hinting windows.
				chars = {
					"a",
					"b",
					"c",
					"d",
					"e",
					"f",
					"g",
					"h",
					"i",
					"j",
					"k",
					"l",
					"m",
					"n",
					"o",
					"p",
					"q",
					"r",
					"s",
					"t",
					"u",
					"v",
					"w",
					"x",
					"y",
					"z",
				},
				-- A group to use for overwriting the Normal highlight group in the floating
				-- window. This can be used to change the background color.
				normal_hl = "BlackOnLightYellow",
				-- The highlight group to apply to the line that contains the hint characters.
				-- This is used to make them stand out more.
				hint_hl = "Bold",
				-- The border style to use for the floating window.
				border = "single",
			})
		end, --}}}
	})
	-- [[norg]]
	use({
		"nvim-neorg/neorg",
		-- commit = '81326c6f8f2dac905f247d79593a2bf17e656b80',
		-- lock=true,
		-- commit='b0b2d07d0ffb25eebc102487a5d0f2b70fa7427e',
		requires = "nvim-lua/plenary.nvim",
		-- lock = true,
	})
	--[[Table Creator]]
	use({
		"dhruvasagar/vim-table-mode",
		ft = "norg",
		-- cmd = "tbc"
	})
	--[[autosave]]
	use({
		"Pocco81/AutoSave.nvim",
		config = function()
			--config{{{
		end, --}}}
	})
	--[[discord rich presence]]
	use({
		"andweeb/presence.nvim",
		lock = true,
		config = function() --{{{
			require("presence"):setup({
				-- General options
				auto_update = true, -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
				neovim_image_text = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
				main_image = "neovim", -- Main image display (either "neovim" or "file")
				client_id = "793271441293967371", -- Use your own Discord application client id (not recommended)
				log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
				debounce_timeout = 10, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
				enable_line_number = false, -- Displays the current line number instead of the current project
				blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
				buttons = true, -- Configure Rich Presence button(s), either a boolean to enable/disable, a static table (`{{ label = "<label>", url = "<url>" }, ...}`, or a function(buffer: string, repo_url: string|nil): table)
				file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
				show_time = true, -- Show the timer

				-- Rich Presence text options
				editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
				file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
				git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
				plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
				reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
				workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
				line_number_text = "Line %s out of %s",
			})
		end, --}}}
	})
	-- [[Lsp Progress]]
	use({
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	})
	use({ "https://github.com/windwp/nvim-ts-autotag" })

	-- [[nvim greeter]]
	use({ --{{{
		"goolord/alpha-nvim",
		lock = true,
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.startify")
			dashboard.section.header.val = {
				[[⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
				[[⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕]],
				[[⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕]],
				[[⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕]],
				[[⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑]],
				[[⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐]],
				[[⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐]],
				[[⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔]],
				[[⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕]],
				[[⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕]],
				[[⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕]],
				[[⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕]],
				[[⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁]],
				[[⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿]],
			}
			alpha.setup(dashboard.opts)
		end,
	}) --}}}

	--[[focus]]
	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup({ width = 95 })
		end,
	})

	--[[session]]
	use("tpope/vim-obsession")
	--[[git related plugins]]
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	--[nvim terminal]]
	use({
		"akinsho/toggleterm.nvim",
		lock = true,
	})

	--[lua functions for nvim]]
	use({
		"nvim-lua/popup.nvim",
		lock = true,
	})

	--[symbol outline]]
	use({
		"simrat39/symbols-outline.nvim",
		lock = true, --{{{
		config = function()
			vim.g.symbols_outline = {
				highlight_hovered_item = true,
				show_guides = true,
				auto_preview = true,
				position = "right",
				relative_width = true,
				width = 55,
				auto_close = false,
				show_numbers = false,
				show_relative_numbers = false,
				show_symbol_details = true,
				preview_bg_highlight = "Pmenu",
				keymaps = { -- These keymaps can be a string or a table for multiple keys
					close = { "<Esc>", "q" },
					goto_location = "<Cr>",
					focus_location = "o",
					hover_symbol = "<C-space>",
					toggle_preview = "K",
					rename_symbol = "r",
					code_actions = "a",
				},
				lsp_blacklist = {},
				symbol_blacklist = {},
				symbols = {
					File = { icon = "", hl = "TSURI" },
					Module = { icon = "", hl = "TSNamespace" },
					Namespace = { icon = "", hl = "TSNamespace" },
					Package = { icon = "", hl = "TSNamespace" },
					Class = { icon = "𝓒", hl = "TSType" },
					Method = { icon = "ƒ", hl = "TSMethod" },
					Property = { icon = "", hl = "TSMethod" },
					Field = { icon = "", hl = "TSField" },
					Constructor = { icon = "", hl = "TSConstructor" },
					Enum = { icon = "ℰ", hl = "TSType" },
					Interface = { icon = "ﰮ", hl = "TSType" },
					Function = { icon = "", hl = "TSFunction" },
					Variable = { icon = "", hl = "TSConstant" },
					Constant = { icon = "", hl = "TSConstant" },
					String = { icon = "𝓐", hl = "TSString" },
					Number = { icon = "#", hl = "TSNumber" },
					Boolean = { icon = "⊨", hl = "TSBoolean" },
					Array = { icon = "", hl = "TSConstant" },
					Object = { icon = "⦿", hl = "TSType" },
					Key = { icon = "🔐", hl = "TSType" },
					Null = { icon = "NULL", hl = "TSType" },
					EnumMember = { icon = "", hl = "TSField" },
					Struct = { icon = "𝓢", hl = "TSType" },
					Event = { icon = "🗲", hl = "TSType" },
					Operator = { icon = "+", hl = "TSOperator" },
					TypeParameter = { icon = "𝙏", hl = "TSParameter" },
				},
			}
		end, --}}}
	})

	--[[Useful lua functions used ny lots of plugins]]
	use({ "nvim-lua/plenary.nvim", opt = false })

	--[[cursor jumpy cool]]
	use({ --{{{
		"edluffy/specs.nvim",
		config = function()
			require("specs").setup({
				show_jumps = true,
				min_jump = 10,
				popup = {
					delay_ms = 0, -- delay before popup displays
					inc_ms = 40, -- time increments used for fade/resize effects
					blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
					width = 10,
					winhl = "PMenu",
					fader = require("specs").linear_fader,
					resizer = require("specs").shrink_resizer,
				},
				ignore_filetypes = {},
				ignore_buftypes = {
					nofile = true,
				},
			})
		end,
	}) --}}}

	--[[matchup]]

	--[[same text change fast]]
	use({
		"osyo-manga/vim-over",
		lock = true,
	})

	--[[Telescope]]
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	}) -- session picker
	--[[file browser]]
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
	})
	-- use { "nvim-telescope/telescope-file-browser.nvim" }

	--[[color preview]]
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		lock = true,
	})

	--[[updats current root directory(imp for lsp to work)]]
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	})

	--[[colorscheme]]
	use({
		"rockyzhang24/arctic.nvim",
		lock = true,
		{ "catppuccin/nvim" },
		"Mofiqul/adwaita.nvim",
		{
			"andersevenrud/nordic.nvim",
		},
		"clpi/cyu.lua",
		"folke/tokyonight.nvim", -- tokyoNight
		"tiagovla/tokyodark.nvim",
		{ "Murtaza-Udaipurwala/gruvqueen" },
		"kvrohit/rasmus.nvim",
		{
			"mcchrish/zenbones.nvim",
			requires = "rktjmp/lush.nvim",
			-- Optionally install Lush. Allows for more configuration or extending the colorscheme
			-- If you don't want to install lush, make sure to set g:zenbones_compat = 1
			-- In Vim, compat mode is turned on as Lush only works in Neovim.
		},
		-- {'olimorris/onedarkpro.nvim'}, -- onedarkpro
		{ "navarasu/onedark.nvim" },
		{ "marko-cerovac/material.nvim" },
		{ "rebelot/kanagawa.nvim" }, -- kangawa}}}
	})

	--[[treesitter]]
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({ "nvim-treesitter/playground" })

	--[[native lsp stuff]]
	use({
		lock = true,
		"neovim/nvim-lspconfig", --lsp base
		"williamboman/nvim-lsp-installer", --auto lsp installer
	})
	--[[highlight similar words]]
	use("RRethy/vim-illuminate")
	--[[formatter]]
	use({ "mhartington/formatter.nvim" })
	--[[goto def float]]
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 100, -- Width of the floating window
				height = 20, -- Height of the floating window
				border = "none", -- Border characters of the floating window
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
	})
	--[[Lsp saga]]
	use({ "tami5/lspsaga.nvim" }) -- nightly

	--[[snippets]]
	use({
		"L3MON4D3/LuaSnip",
		lock = true,
	}) --snippet engine
	use({ "rafamadriz/friendly-snippets", lock = true }) --snippet library

	--[[cmp (completion)]]
	use({
		"hrsh7th/cmp-nvim-lsp", --cmp source lsp
		"hrsh7th/cmp-nvim-lua", --cmp source nvim lua
		"hrsh7th/cmp-buffer", --cmp source buffer
		"hrsh7th/cmp-path", --cmp source path
		"hrsh7th/cmp-cmdline", --cmp source cmd
		"hrsh7th/nvim-cmp", --base of cmp
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"saadparwaiz1/cmp_luasnip", --for snippets
		"onsails/lspkind-nvim", --customizing cmp
		lock = true,
	})
	--[[indent line]]
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.opt.list = true
			require("indent_blankline").setup({
				space_char_blankline = " ",
				show_current_context = true,
				show_current_context_start = true,
			})
		end,
	})

	--[[comments]]
	use({
		"numToStr/Comment.nvim",
		lock = true,
	})
	--[[buffer management]]
	--[[ use {{{{
      'akinsho/bufferline.nvim',
      lock=true,
      requires = 'kyazdani42/nvim-web-devicons'
    } ]]
	--}}}
	use({ --{{{
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	}) --}}}
	--[[status bar]]
	use({
		"hoob3rt/lualine.nvim",
		lock = true,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- use 'rstacruz/vim-closer'
	--[[nvim-autopairs]]
	use({
		"windwp/nvim-autopairs",
		lock = true,
	})
	--[[nvim-ts-rainbow]]
	use("https://github.com/p00f/nvim-ts-rainbow")
	--[[hoppppp]]
	use({
		"phaazon/hop.nvim",
		lock = true,
		as = "hop",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})
end)
