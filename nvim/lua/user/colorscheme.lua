-- Rasmus
--[[ -- {{{
vim.api.nvim_command([=[
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
hi NormalNc guibg=#16181c
]=])-- }}} ]]
-- Kanagawa
--[[ -- {{{
vim.opt.laststatus = 3
vim.opt.fillchars:append({
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┨",
	vertright = "┣",
	verthoriz = "╋",
})
require("kanagawa").setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = { italic = true },
	keywordStyle = { bold = true },
	statementStyle = { bold = true },
	typeStyle = { bold = true, italic = true },
	variablebuiltinStyle = {},
	specialReturn = true, -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	colors = {},
	overrides = {},
	globalStatus = true,
})

vim.cmd([=[
colorscheme kanagawa
hi link CmpPmenu Normal
]=])
-- }}} ]]
-- Zyphyr
--[[ -- {{{
vim.api.nvim_command([=[
colorscheme zephyr
hi NormalNc guibg=#16181c
]=])-- }}} ]]
-- one nord
--[[ -- {{{
require("onenord").setup({
	theme = nil, -- "dark" or "light". Alternatively, remove the option and set vim.o.background instead
	borders = true, -- Split window borders
	fade_nc = true, -- Fade non-current windows, making them more distinguishable
	-- Style that is applied to various groups: see `highlight-args` for options
	styles = {
		comments = "italic",
		strings = "NONE",
		keywords = "italic",
		functions = "bold,italic",
		variables = "NONE",
		diagnostics = "underline",
	},
	disable = {
		background = false, -- Disable setting the background color
		cursorline = false, -- Disable the cursorline
		eob_lines = true, -- Hide the end-of-buffer lines
	},
	-- Inverse highlight for different groups
	inverse = {
		match_paren = true,
	},
	custom_highlights = {}, -- Overwrite default highlight groups
	custom_colors = {}, -- Overwrite default colors
})
-- }}} ]]
-- tokyonight
--[[ -- {{{
require("tokyonight").setup({
	style = "storm",
	transparent = false,
	terminal_colors = true,
	styles = {
		types = {},
		keywords = {},
		functions = {},
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
vim.cmd("colorscheme tokyonight")
-- }}} ]]
-- Catppuccin
-- {{{
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
        neotree=true,
        treesitter_context=true,
        lsp_saga=true,
        hop=true,
        barbar=true,
        treesitter=true,
        illuminate = true,
		notify = false,
        which_key= true,
		mini = false,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
})

-- setup must be called before loading
vim.cmd("colorscheme catppuccin") -- }}}
-- onedark
--[[ --{{{
require('onedark').setup  {
    -- Main options --
    style = 'warm', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
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
vim.cmd("colorscheme onedark")-- }}} ]]
