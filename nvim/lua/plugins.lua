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
	--[[Plugin manager]]
	use("wbthomason/packer.nvim")

	--[[Dependencies]]
	use({
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		use("nvim-lua/popup.nvim"),
	})

	--[[LSP]]
	use({
		lock = true,
		"neovim/nvim-lspconfig", --lsp base
		"williamboman/nvim-lsp-installer", --auto lsp installer
	})
	use("tami5/lspsaga.nvim") -- nightly
	use({ -- {{{"ahmedkhalf/project.nvim",
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	}) -- }}}
	use({ -- {{{"j-hui/fidget.nvim",
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	}) -- }}}
	use({ "mhartington/formatter.nvim" })
	use("RRethy/vim-illuminate")
	use({ -- {{{ "rmagatti/goto-preview",
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
	}) -- }}}

	--[[Completion]]
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

	--[[Snippets]]
	use({
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
	})

	--[[Bufferline]]
	-- use({ "romgrk/barbar.nvim" })

	--[[status bar]]
	use({ "hoob3rt/lualine.nvim" })

	--[[Utility]]
	use("fgheng/winbar.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("xiyaowong/nvim-transparent")
	use("matze/vim-move")
	use("Pocco81/AutoSave.nvim")
	use("andweeb/presence.nvim")
	use("https://github.com/windwp/nvim-ts-autotag")
	use("romainl/vim-devdocs")
	use("Pocco81/HighStr.nvim")
	use("osyo-manga/vim-over")
	use("jghauser/mkdir.nvim")
	use("mg979/vim-visual-multi")
	use("folke/which-key.nvim")
	use("https://gitlab.com/yorickpeterse/nvim-window.git")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-autopairs")
	-- use("SmiteshP/nvim-navic")
	use("https://github.com/haringsrob/nvim_context_vt")
	use({
		"beauwilliams/focus.nvim",
		config = function()
			require("focus").setup({ width = 95 })
		end,
	})
	use({
		"lewis6991/impatient.nvim",
		config = { compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua" },
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	})
	use("https://github.com/p00f/nvim-ts-rainbow")
	use({
		"phaazon/hop.nvim",
		as = "hop",
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	--[[Markdown Preview]]
	use({
		"ellisonleao/glow.nvim",
		branch = "main", -- {{{
		config = function()
			require("glow").setup({
				style = "dark",
				border = "none",
				width = 120,
				paper = true,
			})
		end, -- }}}
	})

	--[[File Browser]]
	use({ "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" })

	--[[Note talking/Scheduling etc]]
	use("nvim-neorg/neorg")
	use({
		"dhruvasagar/vim-table-mode",
		ft = "norg",
	})

	-- [[nvim greeter]]
	use("goolord/alpha-nvim")

	--[[Syntax/Treesitter]]
	use({
		"nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/playground",
		run = ":TSUpdate",
	})

	--[[focus]]

	--[[session]]
	use("tpope/vim-obsession")

	--[[git]]
	use("lewis6991/gitsigns.nvim")

	--[terminal]]
	use("akinsho/toggleterm.nvim")

	--[[Telescope]]
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	}) -- session picker

	--[[colorscheme]]
	use({
		"sainnhe/everforest",
		"rktjmp/lush.nvim",
		"glepnir/zephyr-nvim",
		"rockyzhang24/arctic.nvim",
		"kvrohit/rasmus.nvim",
		"mcchrish/zenbones.nvim",
		-- {'olimorris/onedarkpro.nvim'}, -- onedarkpro
		{ "rebelot/kanagawa.nvim" }, -- kangawa}}}
	})

	--[=[

	--[[scoped tabs]]
	use({
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	})

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

    ]=]
end)
