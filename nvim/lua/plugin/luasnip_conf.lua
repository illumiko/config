local M = {}
config = function()
	local ls = require("luasnip")
	local s = ls.snippet
	local sn = ls.snippet_node
	local t = ls.text_node
	local i = ls.insert_node
	local f = ls.function_node
	local c = ls.choice_node
	local d = ls.dynamic_node
	local r = ls.restore_node
	local l = require("luasnip.extras").lambda
	local rep = require("luasnip.extras").rep
	local p = require("luasnip.extras").partial
	local m = require("luasnip.extras").match
	local n = require("luasnip.extras").nonempty
	local dl = require("luasnip.extras").dynamic_lambda
	local fmt = require("luasnip.extras.fmt").fmt
	local fmta = require("luasnip.extras.fmt").fmta
	local types = require("luasnip.util.types")
	local conds = require("luasnip.extras.expand_conditions")
	local ls = require("luasnip")
	local types = require("luasnip.util.types")

	local opts = require("utils.maps").opts

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
		store_selection_keys = "<Tab>",
	})

	require("luasnip.loaders.from_vscode").lazy_load() -- loads premade snippets
	require("luasnip.loaders.from_lua").load({ paths = "~/dotfiles/nvim/lua/plugin/snippets/" })

	vim.cmd([=[
augroup CustomLuaSnip
	au!
	au TextChanged,InsertLeave * lua require'luasnip'.unlink_current_if_deleted()
augroup end
]=])

	vim.keymap.set(
		"n",
		"<Leader>ll",
		'<Cmd>lua require("luasnip.loaders.from_lua").lazy_load({paths = "~/dotfiles/nvim/lua/plugin/snippets/"})<CR>'
	)
end

M.lazy = {
	"L3MON4D3/LuaSnip",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = config,
}

return M.lazy
