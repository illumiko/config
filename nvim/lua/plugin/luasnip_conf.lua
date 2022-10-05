local ls = require("luasnip")
-- some shorthands...
local types = require("luasnip.util.types")

-- Every unspecified option will be set to the default.
ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	region_check_events = "InsertEnter,InsertLeave",
	delete_check_events = "TextChanged,InsertLeave",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
})
-- autotriggered snippets have to be defined in a separate table, luasnip.autosnippets.

-- in a lua file: search lua-, then c-, then all-snippets.
-- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
--[[
-- Beside defining your own snippets you can also load snippets from "vscode-like" packages
-- that expose snippets in json files, for example <https://github.com/rafamadriz/friendly-snippets>.
-- Mind that this will extend  `ls.snippets` so you need to do it after your own snippets or you
-- will need to extend the table yourself instead of setting a new one.
]]

require("snippets.mySnips")
require("luasnip/loaders/from_vscode").load({ include = { "python" } }) -- Load only python snippets
-- The directories will have to be structured like eg. <https://github.com/rafamadriz/friendly-snippets> (include
-- a similar `package.json`)
require("luasnip/loaders/from_vscode").load({ paths = { "./my-snippets" } }) -- Load snippets from my-snippets folder

-- You can also use lazy loading so you only get in memory snippets of languages you use
require("luasnip/loaders/from_vscode").lazy_load() -- You can pass { paths = "./my-snippets/"} as well

vim.cmd([=[
augroup CustomLuaSnip
	au!
	au TextChanged,InsertLeave * lua require'luasnip'.unlink_current_if_deleted()
augroup end
]=])
