local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"

   -- lspservers with default config
   local servers = { "html", "cssls", "clangd", "intelephense", "tailwindcss", "tsserver", "rome", "cssmodules_ls", "eslint", "quick_lint_js", "marksman", "prosemd_lsp", "omnisharp" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
      }
   end
end

return M
