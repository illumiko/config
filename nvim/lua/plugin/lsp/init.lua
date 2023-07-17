local M = {}
local config = {}
local keys = {}

config.lspconfig = function()
	local status_ok, _ = pcall(require, "lspconfig")
	if not status_ok then
		return
	end
	require("lsp-inlayhints").setup()
	require("plugin.lsp.handlers").setup()
	require("plugin.lsp.lspInstaller")
end

config.goto_preview = {
	width = 100, -- Width of the floating window
	height = 20, -- Height of the floating window
	border = "single", -- Border characters of the floating window
	default_mappings = false, -- Bind default mappings
	debug = false, -- Print debug information
	opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
	resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
	post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
	-- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
	focus_on_open = true, -- Focus the floating window when opening it.
	dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
	force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
	bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
}

config.lsp_signature = {
	max_height = 12, -- max height of signature floating_window
	max_width = 80, -- max_width of signature floating_window
	noice = true,
	floating_window = false,
	fix_pos = true, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = true, -- virtual hint enable
	hint_prefix = " ",
}

keys.goto_preview = {
	{
		"gD",
		":lua require('goto-preview').goto_preview_definition()<cr>",
		silent = true,
		desc = "Preview Definition",
		noremap = true,
	},
	{
		"gI",
		":lua require('goto-preview').goto_preview_implementation()<cr>",
		silent = true,
		desc = "Preview Implementation",
	},
	{ "gc", ":lua require('goto-preview').close_all_win()<cr>", silent = true, desc = "Close Preview" },
	{
		"gR",
		":lua require('goto-preview').goto_preview_references()<cr>",
		silent = true,
		desc = "Preview References",
	},
}

M.lazy = {
	{ "neovim/nvim-lspconfig", config = config.lspconfig },
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"lvimuser/lsp-inlayhints.nvim",
	"RRethy/vim-illuminate",
	-- { "ray-x/lsp_signature.nvim", config = config.lsp_signature },
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	},

	{ "j-hui/fidget.nvim", config = true },

	{ "rmagatti/goto-preview", config = config.goto_preview, keys = keys.goto_preview },
}
return M.lazy
