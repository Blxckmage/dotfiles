return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},

	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("nvim-web-devicons").setup({
				override = {},
				default = true,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	},
	{
		"tamton-aquib/staline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("staline").setup({
				sections = {
					left = { "  ", "mode", " ", "branch", " " },
					mid = { "file_name" },
					right = { "lsp", "  ", "line_column" },
				},
				mode_colors = {
					i = "#ffb86c",
					n = "#a3be8c",
					c = "#88c0d0",
					v = "#d08770",
				},
				defaults = {
					true_colors = true,
					line_column = " [%l/%L] :%c  ",
					branch_symbol = " ",
				},
			})
		end,
	},
	{ "christoomey/vim-tmux-navigator" },
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("Comment").setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("treesitter-context").setup({})
		end,
	},
}
