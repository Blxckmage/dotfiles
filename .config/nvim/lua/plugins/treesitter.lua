require("util.event").lazy_file()

return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		version = false,
		event = { "LazyFile", "VeryLazy" },
		lazy = vim.fn.argc(-1) == 0,
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
			ensure_installed = {
				"json",
				"vim",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"lua",
				"rust",
				"markdown",
				"markdown_inline",
				"python",
				"c",
				"yaml",
				"regex",
			},
		},
		config = function(_, opts)
			local TS = require("nvim-treesitter")
			if not TS.get_installed then
				vim.notify("nvim-treesitter failed to load properly", vim.log.levels.ERROR)
				return
			end
			TS.setup(opts)
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
