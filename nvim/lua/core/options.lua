local opt = vim.opt
local g = vim.g

g.mapleader = " "

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.number = true
opt.relativenumber = true
opt.autowrite = true
opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.incsearch = true
opt.showmatch = true
opt.hlsearch = false
opt.ignorecase = true
opt.title = true
opt.cmdheight = 1
opt.laststatus = 2
opt.showtabline = 2
opt.backup = false
opt.swapfile = false
opt.backupskip = "/tmp/*,/private/tmp*"

if vim.fn.executable("rg") == 1 then
	opt.grepformat = "%f:%l:%c:%m"
	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

opt.autoindent = true
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.wrap = false
opt.mouse = "a"
opt.pumblend = 10
opt.pumheight = 10
opt.scrolloff = 8
opt.showcmd = true
opt.showmode = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true
opt.background = "dark"
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
