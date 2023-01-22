local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

lazy.setup({
	-- Core
	"nvim-lua/plenary.nvim",

	-- Telescope
	{ "nvim-telescope/telescope.nvim", module = "telescope", cmd = "Telescope" },
	{ "nvim-telescope/telescope-file-browser.nvim", keys = "sf" },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = "TSUpdate" },

	-- LSP Setup
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig", event = "BufReadPre" },
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Autocompletion
			{
				"hrsh7th/nvim-cmp",
				event = "InsertEnter",
				dependencies = {
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"saadparwaiz1/cmp_luasnip",
					"hrsh7th/cmp-nvim-lsp",
					"hrsh7th/cmp-nvim-lua",
				},
			},

			-- Snippets
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{ "glepnir/lspsaga.nvim", event = "BufRead" },

	-- Auto Closing
	{ "windwp/nvim-autopairs", dependencies = "nvim-cmp" },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" },

	-- Null LS
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- UI
	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
	{ "kyazdani42/nvim-web-devicons", lazy = false },
	{ "tamton-aquib/staline.nvim", dependencies = "nvim-lspconfig" },
	"akinsho/nvim-bufferline.lua",
	"norcalli/nvim-colorizer.lua",

	-- Other
	{ "iamcco/markdown-preview.nvim", ft = "markdown" },
	"numToStr/Comment.nvim",
	"andweeb/presence.nvim",
	{ "phaazon/hop.nvim", event = "BufReadPost", branch = "v2" },
	"prichrd/netrw.nvim",
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
		dependencies = {
			"mfussenegger/nvim-dap",
			cmd = {
				"DapSetLogLevel",
				"DapShowLog",
				"DapContinue",
				"DapToggleBreakpoint",
				"DapToggleRepl",
				"DapStepOver",
				"DapStepInto",
				"DapStepOut",
				"DapTerminate",
			},
		},
	},
})
