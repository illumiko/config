local M = {}
config = function()
	local cmp_status_ok, cmp = pcall(require, "cmp")
	if not cmp_status_ok then
		return
	end

	local has_words_before = function()
		unpack = unpack or table.unpack
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local compare = require("cmp.config.compare")

	cmp.setup({
		snippet = { -- {{{
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		}, -- }}}
		mapping = { -- {{{
			["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<A-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
			["<C-j>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, { "i", "s" }),

			["<C-k>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<C-l>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<C-e>"] = cmp.mapping({
				i = cmp.mapping.abort(),
				c = cmp.mapping.close(),
			}),
		}, -- }}}
		sources = cmp.config.sources({ -- {{{
			{ name = "luasnip", group_index = 2, keyword_length = 2 },
			{
				name = "nvim_lsp",
				group_index = 2,
			},
			{ name = "nvim_lua", group_index = 2 },
			{ name = "buffer", group_index = 2, keyword_length = 4 },
			{ name = "path" },
			{ name = "neorg" },
			-- { name = 'ultisnips' }, -- For ultisnips users.
			-- { name = 'snippy' }, -- For snippy users.
		}), -- }}}
		formatting = { -- {{{ the good kind
			fields = { "kind", "abbr", "menu" },
			format = function(entry, vim_item)
				local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
				local strings = vim.split(kind.kind, "%s", { trimempty = true })
				kind.kind = " " .. strings[1] .. " "
				kind.menu = "    (" .. strings[2] .. ")"

				return kind
			end,
		}, -- }}}
		sorting = { -- {{{
			priority_weight = 2,
			comparators = {
				-- require("copilot_cmp.comparators").prioritize,
				-- require("copilot_cmp.comparators").score,
				compare.offset,
				compare.exact,
				-- compare.scopes,
				compare.score,
				compare.recently_used,
				compare.locality,
				-- compare.kind,
				compare.sort_text,
				compare.length,
				compare.order,
				-- require("copilot_cmp.comparators").prioritize,
				-- require("copilot_cmp.comparators").score,
			},
		}, -- }}}
		experimental = { -- {{{
			ghost_text = false,
		}, -- }}}
		confirm_opts = { -- {{{
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}, -- }}}
		window = { -- {{{
			documentation = {
				border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
				winhighlight = "Normal:NormalFloat,FloatBorder:Normal,CursorLine:PmenuSel,Search:None",
				max_width = 200,
			},
			completion = {
				-- border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" },
                border = none,
				winhighlight = "Normal:NormalFloat,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
				col_offset = -3,
				side_padding = 0,
				keyword_length = 2,
			},
		}, -- }}}
		preselect = cmp.PreselectMode.None,
	})

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end
M.lazy = {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", --cmp source lsp
		"hrsh7th/cmp-nvim-lua", --cmp source nvim lua
		"hrsh7th/cmp-buffer", --cmp source buffer
		"hrsh7th/cmp-path", --cmp source path
		"hrsh7th/cmp-cmdline", --cmp source cmd
		"saadparwaiz1/cmp_luasnip", --for snippets
		"onsails/lspkind-nvim", --customizing cmp
	},
	config = config,
}
return M.lazy
