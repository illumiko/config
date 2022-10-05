local nvim_lsp = require('lspconfig')
local configs = require'lspconfig/configs'    

local capability = vim.lsp.protocol.make_client_capabilities()
capability.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.tsserver.setup {
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
}
nvim_lsp.cssls.setup {
  filetypes = { "css", "scss", "less" },
  capabilities = capability
  
}
nvim_lsp.vuels.setup {
  capabilities = capability,
  settings = {
      vetur = {
          -- completion = {
          --     autoImport = true,
          --     useScaffoldSnippets = true
          -- },
          format = {
              defaultFormatter = {
                  html = "none",
                  js = "none",
                  ts = "none",
              }
          },
          validation = {
              template = true,
              script = true,
              style = true,
              templateProps = true,
              interpolation = true
          },
          experimental = {
              templateInterpolationService = true
          }
      }
  },
}

--lsp confs
-- nvim_lsp.volar.setup {
--     capabilities = capability
-- }
nvim_lsp.html.setup {
    capabilities = capability
}
nvim_lsp.emmet_ls.setup {
    filetypes = { "html", "css"},
    root_dir = function(fname)    
       return vim.loop.cwd()
    end;  
    capabilities = capability
}
nvim_lsp.tailwindcss.setup {
  capabilities = capability,
}
nvim_lsp.jsonls.setup{
 capabilities = capability
}
nvim_lsp.yamlls.setup {
  capabilities = capability
}
nvim_lsp.pyright.setup{}
nvim_lsp.pylsp.setup{}
