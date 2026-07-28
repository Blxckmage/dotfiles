require("util.event").lazy_file()

return {
	{
		"romus204/tree-sitter-manager.nvim",
		event = { "LazyFile", "VeryLazy" },
		dependencies = {},
		config = function()
			require("tree-sitter-manager").setup()
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
