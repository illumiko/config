require("nvim-treesitter.configs").setup({
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,
		disable = { "html", "css", "sass", 'latex' },
	},
	indent = {
		enable = true,
		disable = {},
	},
	-- context_commentstring = {
	--   enable = true
	-- },
	autotag = {
		enable = true,
	},
	markid = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = 10000, -- Do not enable for files with more than n lines, int
		-- termcolors = {} -- table of colour name strings
	},
	-- ensure_installed = {
	-- 	"javascript",
	-- 	"vue",
	-- 	"html",
	-- 	"css",
	-- 	"scss",
	-- 	"python",
	-- },
})
