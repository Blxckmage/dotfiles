require("core.options")
require("core.keymaps")
require("core.autocmds")

-- bootstrap lazy and run plugins
require("core.lazy")

-- NOTE: catppuccin, rose-pine, tokyonight(can be found on lua/plugins/themes)
local name = "catppuccin"
pcall(require, "plugins.themes." .. name)

-- Set theme
vim.cmd.colorscheme(name)
