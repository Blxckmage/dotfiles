# Blxckmage's Neovim config

> If I had 8h to write a program, I would spend 6h tweaking my neovim config. -Abraham Lincoln

## Neovim setup

> Requires [Neovim](https://neovim.io/) (>= 0.9)

#### Core Plugins

- [folke/lazy.nvim](https://github.com/folke/lazy.nvim) - Modern plugin manager for Neovim.
- [nvim-lua/plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Essential lua functions.

#### Telescope

- [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - Fuzzy finding select menu with text.
- [nvim-telescope/telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) - File Browser extension for telescope.nvim

#### Treesitter

- [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - [Treesitter](https://github.com/tree-sitter/tree-sitter) configurations and abstraction layer for Neovim.
- [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) - Show code context

#### LSP

- [VonHeikemen/lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim/) - LSP Starting Point
- [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - A collection of configurations for Neovim's built-in LSP.
- [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim) - Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
- [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) - Extension to mason.nvim that makes it easier to use lspconfig with mason.nvim.

#### Autocompletion

- [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - A completion engine plugin for neovim written in Lua
- [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer) - nvim-cmp source for buffer words
- [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path) - nvim-cmp source for filesystem paths.
- [saadparwaiz1/cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) - luasnip completion source for nvim-cmp
- [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) - nvim-cmp source for neovim's built-in LSP
- [hrsh7th/cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) - nvim-cmp source for neovim Lua API.

#### Snippets

- [L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip) - Snippet Engine for Neovim written in Lua
- [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets) - Set of preconfigured snippets for different languages.

#### Auto Closing

- [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) - Use treesitter to auto close and auto rename html tag.
- [echasnovski/mini.pairs](https://github.com/echasnovski/mini.pairs) - Neovim Lua plugin to automatically manage character pairs.

#### Formatter & Linter

- [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim) - Lightweight yet powerful formatter plugin for Neovim
- [mfussenegger/nvim-lint](https://github.com/mfussenegger/nvim-lint) - Asynchronous linter plugin for Neovim

#### UI Plugins

- [MunifTanjim/nui.nvim](https://github.com/MunifTanjim/nui.nvim) - UI Component Library for Neovim.
- [kyazdani42/nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) - Lua fork of vim devicons which lets you change colors and edit icons of filetypes.
- [tamton-aquib/staline.nvim](https://github.com/tamton-aquib/staline.nvim) - A modern lightweight statusline and bufferline plugin for neovim in lua.
- [akinsho/nvim-bufferline.lua](https://github.com/akinsho/nvim-bufferline.lua) - A snazzy bufferline
- [norcalli/nvim-colorizer](https://github.com/norcalli/nvim-colorizer.lua) - Neovim colorizer, colors hex colors, hsl codes and more.
- [echasnovski/mini.indentscope](https://github.com/echasnovski/mini.indentscope) - Neovim Lua plugin to visualize and operate on indent scope.
- [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim) - Neovim plugin to improve the default vim.ui interfaces
- [folke/noice.nvim](https://github.com/folke/noice.nvim) - Neovim plugin that completely replaces the UI for messages, cmdline and the popupmenu.
- [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim) - Neovim Dashboard

#### Colorscheme

- [catppuccin/nvim](https://github.com/catppuccin/nvim) - Catppuccin Theme
- [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Tokyo Night Theme
- [rose-pine/neovim](https://github.com/rosepin/neovim) - Rose pine Theme

#### Tools

- [mfussenegger/nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug Adapter Protocol Client for Neovim
- [iamcco/markdown-preview.nvim](https://https://github.com/iamcco/markdown-preview.nvim) - Markdown preview on browser with synchronized scrolling
- [simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim) - Rust tools for better rust development in Neovim.

#### Utilities

- [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim) - Edit filesystem like buffer
- [echasnovski/mini.comment](https://github.com/echasnovski/mini.comment) - Fast neovim comment plugin
- [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim) - Highlight, list and search todo comments in your projects
- [echasnovski/mini.comment](https://github.com/echasnovski/mini.animate) - Animate neovim motions
- [ThePrimeagen/harpoon](https://github.com/ThePrimeagen/harpoon) - Fast file navigation
