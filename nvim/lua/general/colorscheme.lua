--[[ -- tokyodark {{{
vim.g.tokyodark_transparent_background = true
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1"
--}}} ]]
--[[ --tokyonight{{{
vim.g.tokyonight_style = 'storm'
vim.g.tokyonight_transparent = true
vim.cmd([=[colorscheme tokyonight]=])
--}}} ]]
--[[ --onedark--{{{
require('onedark').setup  {
    -- Main options --
    style = 'warmer', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    transparent = false,  -- Show/hide background
    term_colors = true, -- Change terminal color as per the selected theme style
    ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
    -- toggle theme style ---
    toggle_style_key = '<leader>ts', -- Default keybinding to toggle
    toggle_style_list = {'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'}, -- List of styles to toggle between

    -- Change code style ---
    -- Options are italic, bold, underline, none
    -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
    code_style = {
        comments = 'italic',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
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
vim.cmd('colorscheme onedark')
--}}} ]]
--[[ --material{{{
require("material").setup({
	contrast = {
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = true, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = true, -- Enable darker background for the cursor line
		non_current_windows = true, -- Enable darker background for non-current windows
		popup_menu = true, -- Enable lighter background for the popup menu
	},

	italics = {
		comments = true, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = true, -- Enable italic strings
		variables = true, -- Enable italic variables
	},

	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf", -- Darker qf list background
	},

	high_visibility = {
		lighter = true, -- Enable higher contrast text for lighter style
		darker = true, -- Enable higher contrast text for darker style
	},

	disable = {
		borders = false, -- Disable borders between verticaly split windows
		background = false, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = true, -- Hide the end-of-buffer lines
	},

	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
})
vim.g.material_style = "oceanic"
vim.cmd([=[
    colorscheme material
]=]) --}}} ]]
--[[ -- rasmus{{{
vim.cmd([=[
colorscheme rasmus
hi BufferVisible guibg=#444444 guifg=#666666
hi BufferVisibleSign guibg=#444444 guifg=#666666
hi BufferVisibleIndex guibg=#444444 guifg=#666666
hi PmenuSel guibg=#7bb099
hi LspReferenceRead guibg=#4b4b49 guifg=none
hi LspReferenceText guibg=#4b4b49 guifg=none
hi LspReferenceWrite guibg=#4b4b49 guifg=none
hi CmpItemKindSnippet guifg=#7bb099
hi CmpItemKindText guifg=#d1d1d1
hi CmpItemKindKeyword guifg=#ffc591
]=]) --}}} ]]
--[[ --catppuccin--{{{
local catppuccin = require("catppuccin")
catppuccin.setup({
	transparent_background = false,
	term_colors = false,
	styles = {
		comments = "italic",
		conditionals = "italic",
		loops = "NONE",
		functions = "italic",
		keywords = "bold",
		strings = "NONE",
		variables = "italic",
		numbers = "NONE",
		booleans = "NONE",
		properties = "italic",
		types = "NONE",
		operators = "italic",
	},
	integrations = {
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = "italic",
				hints = "italic",
				warnings = "italic",
				information = "italic",
			},
			underlines = {
				errors = "underline",
				hints = "underline",
				warnings = "underline",
				information = "underline",
			},
		},
		lsp_trouble = false,
		cmp = true,
		lsp_saga = true,
		gitgutter = false,
		gitsigns = true,
		telescope = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		neotree = {
			enabled = true,
			show_root = true,
			transparent_panel = false,
		},
		which_key = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		dashboard = true,
		neogit = false,
		vim_sneak = false,
		fern = false,
		barbar = true,
		bufferline = false,
		markdown = true,
		lightspeed = false,
		ts_rainbow = true,
		hop = true,
		notify = false,
		telekasten = false,
		symbols_outline = true,
	},
})
vim.g.catppuccin_flavour = "macchiato"
vim.cmd([=[colorscheme catppuccin]=])
--}}} ]]
--kanagawa{{{
require("kanagawa").setup({
	undercurl = false, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { italic = true },
	keywordStyle = { bold = true },
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true },
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	colors = {},
	overrides = {},
})
vim.cmd([[colorscheme kanagawa]])
--}}}
--[[ -- gruvbox{{{
vim.o.background = "dark" -- or light if you so prefer

require("gruvqueen").setup({
	config = {
		disable_bold = true,
		italic_comments = false,
		italic_keywords = false,
		italic_functions = false,
		italic_variables = false,
		invert_selection = false,
		style = "original", -- possible values: 'original', 'mix', 'material'
		transparent_background = false,
		-- bg_color = "black",
	},
}) --}}} ]]
--[[ --{{{ --nord

-- The table used in this example contains the default settings.
-- Modify or remove these to your liking (this also applies to alternatives below):
require("nordic").colorscheme({
	-- Underline style used for spelling
	-- Options: 'none', 'underline', 'undercurl'
	underline_option = "none",

	-- Italics for certain keywords such as constructors, functions,
	-- labels and namespaces
	italic = false,

	-- Italic styled comments
	italic_comments = true,

	-- Minimal mode: different choice of colors for Tabs and StatusLine
	minimal_mode = true,

	-- Darker backgrounds for certain sidebars, popups, etc.
	-- Options: true, false, or a table of explicit names
	-- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
	alternate_backgrounds = true,

	-- Callback function to define custom color groups
	-- See 'lua/nordic/colors/example.lua' for example defitions
	custom_colors = function(c, s, cs)
		return {}
	end,
})
-- Load the colorscheme
vim.cmd([=[colorscheme nordic]=]) --}}} ]]
vim.cmd([[colorscheme arctic]])
