vim.cmd("autocmd!")

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Clipboard
vim.opt.clipboard:prepend({ "unnamed", "unnamedplus" })

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Search
vim.opt.incsearch = true
vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true

-- Window
vim.opt.title = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2

-- File
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.backupskip = "/tmp/*,/private/tmp*"

-- Indentation
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.ai = true -- Auto Indent
vim.opt.si = true -- Smart Indent

-- Text wrapping
vim.opt.wrap = false

-- Find in files
vim.opt.path:append({ "**" }) -- search into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Mapping
vim.g.mapleader = " "

-- Scrolling
vim.opt.scrolloff = 8

-- Command line
vim.opt.showcmd = true

-- vim.opt.shell = "powershell"
vim.opt.inccommand = "split"

-- Cursor
vim.opt.cursorline = true

-- Colors
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Window blending
vim.opt.winblend = 0

-- Completion
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 5

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
