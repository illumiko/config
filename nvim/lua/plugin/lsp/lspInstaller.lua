require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({
			on_attach = require("plugin.lsp.handlers").on_attach,
			capabilities = require("plugin.lsp.handlers").capabilities,
		})
	end,
	-- Next, you can provide a dedicated handler for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	-- ["rust_analyzer"] = function()
	-- 	require("rust-tools").setup({})
	-- end,
})

--[=[ local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")-- {{{
if not status_ok then
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("plugin.lsp.handlers").on_attach,
		capabilities = require("plugin.lsp.handlers").capabilities,
	}

	if server.name == "jsonls" then
		local jsonls_opts = require("plugin.lsp.settings.jsonls")
		opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
	end

	if server.name == "sumneko_lua" then
		local sumneko_opts = require("plugin.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server.name == "pyright" then
		local pyright_opts = require("plugin.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end
	--[[ if server.name == "gopls" then
		local gopls_opts = require("plugin.lsp.settings.gopls")
		opts = vim.tbl_deep_extend("force", gopls_opts, opts)
	end ]]

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)-- }}} ]=]
