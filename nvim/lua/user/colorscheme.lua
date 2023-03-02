-- Kanagawa-- {{{
--
-- vim.opt.laststatus = 3
-- vim.opt.fillchars:append({
-- 	horiz = "━",
-- 	horizup = "┻",
-- 	horizdown = "┳",
-- 	vert = "┃",
-- 	vertleft = "┨",
-- 	vertright = "┣",
-- 	verthoriz = "╋",
-- })
-- require("kanagawa").setup({
-- 	undercurl = true, -- enable undercurls
-- 	commentStyle = { italic = true },
-- 	functionStyle = { italic = true },
-- 	keywordStyle = { bold = true },
-- 	statementStyle = { bold = true },
-- 	typeStyle = { bold = true, italic = true },
-- 	variablebuiltinStyle = {},
-- 	specialReturn = true, -- special highlight for the return keyword
-- 	specialException = true, -- special highlight for exception handling keywords
-- 	transparent = true, -- do not set background color
-- 	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
-- 	colors = {},
-- 	overrides = {},
-- 	globalStatus = true,
-- })
-- vim.cmd([=[
-- colorscheme kanagawa
-- hi link CmpPmenu Normal
-- ]=])
-- -- }}}
--
-- tokyonight -- {{{
--[[
require("tokyonight").setup({
	style = "night",
	transparent = true,
	terminal_colors = true,
	styles = {
		types = { italic = true, bold = true },
		keywords = { italic = true },
		functions = { bold = true },
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebaers = { "qf", "help" },
	dim_inactive = true,
	-- day_brightness = 0.3
	--boarderless telescope
	on_highlights = function(hl, c)
		local prompt = "#2d3149"
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePreviewTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
	end,
})
vim.cmd("colorscheme tokyonight") -- }}} 
--]]

--[[ -- Catppuccin-- {{{

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	background = { -- :h background
		light = "latte",
		dark = "macchiato",
	},
	transparent_background = false,
	term_colors = true,
	dim_inactive = {
		enabled = true,
		shade = "dark",
		percentage = 0.65,
	},
	no_italic = true, -- Force no italic
	no_bold = true, -- Force no bold
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = { "bold" },
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = { "bold" },
		types = { "bold", "italic" },
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		telescope = true,
		neotree = true,
		treesitter_context = true,
		lsp_saga = true,
		hop = true,
		barbar = true,
		treesitter = true,
		illuminate = true,
		notify = false,
		which_key = true,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd("colorscheme catppuccin") -- }}} ]]
--[[ -- onedark{{{
--
require('onedark').setup  {
    -- Main options --
    style = 'deep', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

    -- toggle theme style ---
    toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'bold',
        functions = 'bold,italic',
        strings = 'none',
        variables = 'none'
    },

    -- Lualine options --
    lualine = {
        transparent = false, -- lualine center bar transparency
    },

    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}
vim.cmd("colorscheme onedark")
-- }}} ]]

-- Doom one{{{
--
-- -- Add color to cursor
-- vim.g.doom_one_cursor_coloring = true
-- -- Set :terminal colors
-- vim.g.doom_one_terminal_colors = true
-- -- Enable italic comments
-- vim.g.doom_one_italic_comments = true
-- -- Enable TS support
-- vim.g.doom_one_enable_treesitter = true
-- -- Color whole diagnostic text or only underline
-- vim.g.doom_one_diagnostics_text_color = true
-- -- Enable transparent background
-- vim.g.doom_one_transparent_background = false
-- -- Pumblend transparency
-- vim.g.doom_one_pumblend_enable = true
-- vim.g.doom_one_pumblend_transparency = 20
-- -- Plugins integration
-- vim.g.doom_one_plugin_neorg = true
-- vim.g.doom_one_plugin_barbar = true
-- vim.g.doom_one_plugin_telescope = true
-- vim.g.doom_one_plugin_neogit = false
-- vim.g.doom_one_plugin_nvim_tree = false
-- vim.g.doom_one_plugin_dashboard = true
-- vim.g.doom_one_plugin_startify = true
-- vim.g.doom_one_plugin_whichkey = true
-- vim.g.doom_one_plugin_indent_blankline = true
-- vim.g.doom_one_plugin_vim_illuminate = true
-- vim.g.doom_one_plugin_lspsaga = false
-- vim.cmd("colorscheme doom-one") 
--
--}}}

-- -- Gruvbox{{{

require("gruvbox").setup({
	undercurl = true,
	underline = true,
	bold = true,
	italic = true,
	strikethrough = true,
	invert_selection = false,
	invert_signs = false,
	invert_tabline = false,
	invert_intend_guides = false,
	inverse = true, -- invert background for search, diffs, statuslines and errors
	contrast = "", -- can be "hard", "soft" or empty string
	palette_overrides = {},
	overrides = {},
	dim_inactive = false,
	transparent_mode = true,
})
vim.cmd("hi IndentBlanklineChar guifg=none")
vim.cmd("colorscheme gruvbox")

-- }}}

-- Nord {{{
--
-- require("nord").setup({
-- 	-- your configuration comes here
-- 	-- or leave it empty to use the default settings
-- 	transparent = false, -- Enable this to disable setting the background color
-- 	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
-- 	diff = { mode = "bg" }, -- enables/disables colorful backgrounds when used in diff mode. values : [bg|fg]
-- 	borders = true, -- Enable the border between verticaly split windows visible
-- 	errors = { mode = "bg" }, -- Display mode for errors and diagnostics
-- 	-- values : [bg|fg|none]
-- 	styles = {
-- 		-- Style to be applied to different syntax groups
-- 		-- Value is any valid attr-list value for `:help nvim_set_hl`
-- 		comments = { italic = true },
-- 		keywords = {},
-- 		functions = {},
-- 		variables = {},
-- 		-- To customize lualine/bufferline
-- 		bufferline = {
-- 			current = {},
-- 			modified = { italic = true },
-- 		},
-- 	},
-- 	-- colorblind mode
-- 	-- see https://github.com/EdenEast/nightfox.nvim#colorblind
-- 	-- simulation mode has not been implemented yet.
-- 	colorblind = {
-- 		enable = false,
-- 		preserve_background = false,
-- 		severity = {
-- 			protan = 0.0,
-- 			deutan = 0.0,
-- 			tritan = 0.0,
-- 		},
-- 	},
-- 	--- You can override specific highlights to use other groups or a hex color
-- 	--- function will be called with all highlights and the colorScheme table
-- 	on_highlights = function(highlights, colors) end,
-- })
-- vim.cmd("colorscheme nord")
--
-- }}}
