require("core.options")
require("core.keymaps")
require("core.autocmds")

-- bootstrap lazy and run plugins
require("core.lazy")

-- Set theme
vim.cmd.colorscheme("catppuccin")
