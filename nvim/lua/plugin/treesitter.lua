-- for neorg
--[[ local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
parser_configs.norg = {
  install_info = {
    files = { "src/parser.c", "src/scanner.cc" },
    url = "https://github.com/nvim-neorg/tree-sitter-norg",
    branch = "main"
  },
}

parser_configs.norg_meta = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
    files = { "src/parser.c" },
    branch = "main"
  },
}

parser_configs.norg_table = {
  install_info = {
    url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
    files = { "src/parser.c" },
    branch = "main"
  },
} ]]

-- treesitter startup
require("nvim-treesitter.configs").setup({
	ignore_install = { "" }, -- List of parsers to ignore installing
	highlight = {
		enable = true,
		disable = { "html", "css", "sass" },
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
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- termcolors = {} -- table of colour name strings
	},
	ensure_installed = {
		--"norg",
		"javascript",
		"vue",
		"html",
		"css",
		"scss",
		"python",
	},
})
require("nvim-treesitter.configs").setup({
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
