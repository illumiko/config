-- rasmus{{{
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
]=]) --}}}
--kanagawa{{{
-- require("kanagawa").setup({
-- 	undercurl = false, -- enable undercurls
-- 	commentStyle = { italic = true },
-- 	functionStyle = { italic = true },
-- 	keywordStyle = { bold = true },
-- 	statementStyle = { bold = true },
-- 	typeStyle = {},
-- 	variablebuiltinStyle = { italic = true },
-- 	specialReturn = true, -- special highlight for the return keyword
-- 	specialException = true, -- special highlight for exception handling keywords
-- 	transparent = false, -- do not set background color
-- 	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
-- 	colors = {},
-- 	overrides = {},
-- })
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
-- --[[ --{{{ --nord
--
-- -- The table used in this example contains the default settings.
-- -- Modify or remove these to your liking (this also applies to alternatives below):
-- require("nordic").colorscheme({
-- 	-- Underline style used for spelling
-- 	-- Options: 'none', 'underline', 'undercurl'
-- 	underline_option = "none",
--
-- 	-- Italics for certain keywords such as constructors, functions,
-- 	-- labels and namespaces
-- 	italic = false,
--
-- 	-- Italic styled comments
-- 	italic_comments = true,
--
-- 	-- Minimal mode: different choice of colors for Tabs and StatusLine
-- 	minimal_mode = true,
--
-- 	-- Darker backgrounds for certain sidebars, popups, etc.
-- 	-- Options: true, false, or a table of explicit names
-- 	-- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
-- 	alternate_backgrounds = true,
--
-- 	-- Callback function to define custom color groups
-- 	-- See 'lua/nordic/colors/example.lua' for example defitions
-- 	custom_colors = function(c, s, cs)
-- 		return {}
-- 	end,
-- })
-- -- Load the colorscheme
--}}} ]]
--[[ -- {{{ solarized
vim.g.solarized_italics = 1
vim.g.solarized_visibility = "high"
-- vim.g.solarized_statusline = "flat"}}} ]]

--[[ vim.api.nvim_command([=[
colorscheme zephyr
hi NormalNc guibg=#16181c
]=]) ]]
vim.api.nvim_command([=[
colorscheme everforest
hi Normal guibg=none
hi NormalNc guibg=#16181c
]=])
