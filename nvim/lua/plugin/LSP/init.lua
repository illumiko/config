local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('plugin.LSP.lspInstaller')
require('plugin.LSP.handlers').setup()
-- {{{ for emmet
local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = {
        'javascriptreact',
        'typescriptreact',
      };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

lspconfig.ls_emmet.setup { capabilities = capabilities }-- }}}
