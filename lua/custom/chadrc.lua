-- Just an example, supposed to be placed in /lua/custom/
vim.cmd [[hi normal guibg=NONE ctermbg=NONE]]


local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyonight",
   transparency = true,
}

M.plugins = {
   user = {
      ["goolord/alpha-nvim"] = {
         disable = false,
      },
   },
   options = {
       lspconfig = {
           setup_lspconf = "custom.plugins.lspconfig",
       },
   },
}

-- M.options = {
--   tabstop = 4,
--   shiftwidth = 4,
--   smarttab = true,
--   relativenumber = true,
--   number = true,
-- }

return M
