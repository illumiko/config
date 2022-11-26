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
require("luasnip.loaders.from_vscode").lazy_load() -- loads premade snippets
require("snippets.mySnips")
vim.cmd([=[
augroup CustomLuaSnip
	au!
	au TextChanged,InsertLeave * lua require'luasnip'.unlink_current_if_deleted()
augroup end
]=])
