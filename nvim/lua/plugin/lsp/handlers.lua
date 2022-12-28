local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = true,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = false,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "single",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

local function lsp_highlight_document(client)
	-- if client.server_capabilities.document_highlight then
	local status_ok, illuminate = pcall(require, "illuminate")
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
	-- end
end
local function nav(client, bufnr)
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end
	navic.attach(client, bufnr)
end
local function inlay_hints(client, bufnr)
	local status_ok, inlay = pcall(require, "lsp-inlayhints")
	if not status_ok then
		return
	end
	inlay.on_attach(client, bufnr)
end
local function lsp_keymaps(bufnr)
	-- local opts = { noremap = true, silent = true }
	local map = vim.api.nvim_buf_set_keymap
	map(0, "n", "gr", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })
	map(0, "n", "gx", "<cmd>Lspsaga code_action<cr>", { silent = true, noremap = true })
	-- map(0, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", { silent = true, noremap = true })
	map(0, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", { silent = true, noremap = true })
	map(0, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", { silent = true, noremap = true })
	map(0, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { silent = true, noremap = true })
	map(0, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>", {})
	map(0, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>", {})
end
M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	nav(client, bufnr)
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
	inlay_hints(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
} -- for nvim-ufo

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
