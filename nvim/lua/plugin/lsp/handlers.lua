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
	local nmap = require("utils.maps").nmap
	local opts = require("utils.maps").opts

	nmap("rn", vim.lsp.buf.rename, opts("Rename"))
	nmap("gx", vim.lsp.buf.code_action, opts("Code Action"))
	nmap("gd", vim.lsp.buf.definition, opts("Goto Def"))
	nmap("gt", vim.lsp.buf.type_definition, opts("Goto Def"))
	nmap("gi", vim.lsp.buf.implementation, opts("implementation"))
	nmap("gr", vim.lsp.buf.references, opts("References"))
	nmap("go", vim.diagnostic.open_float, opts("Diagnostic View"))
	nmap("gj", vim.diagnostic.goto_next, opts("J Diagnostic"))
	nmap("gk", vim.diagnostic.goto_prev, opts("K Diagnostic"))
	nmap("K", function()
			-- choose one of coc.nvim and nvim lsp
			vim.lsp.buf.hover()
	end, {desc = "Hover", noremap = true, silent = true })
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	nav(client, bufnr)
	lsp_highlight_document(client)
	inlay_hints(client, bufnr)
	lsp_keymaps(bufnr)
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
