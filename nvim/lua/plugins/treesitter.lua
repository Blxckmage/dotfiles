return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		module = true,
		event = { "VeryLazy" },
		cmd = {
			"TSInstall",
			"TSInstallInfo",
			"TSUpdate",
			"TSBufEnable",
			"TSBufDisable",
			"TSEnable",
			"TSDisable",
			"TSModuleInfo",
		},
		build = ":TSUpdate",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			autopairs = { enable = true },
			autotag = { enable = true },
			ensure_installed = {
				"json",
				"vim",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"lua",
				"json",
				"rust",
				"markdown",
				"markdown_inline",
				"python",
				"c",
				"yaml",
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		enabled = true,
		opts = { mode = "cursor", max_lines = 3 },
	},
	{
		"windwp/nvim-ts-autotag",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		opts = {},
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		lazy = true,
		opts = {
			enable_autocmd = false,
		},
	},
}
