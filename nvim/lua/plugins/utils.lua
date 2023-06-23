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
			local icons = require("nvim-web-devicons")

			icons.setup({
				override = {},
				default = true,
			})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			local autotag = require("nvim-ts-autotag")

			autotag.setup({})
		end,
	},
	{
		"tamton-aquib/staline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local staline = require("staline")
			staline.setup({
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
			local comment = require("Comment")
			comment.setup({})
		end,
	},
	{
		"prichrd/netrw.nvim",
		config = function()
			local netrw = require("netrw")
			netrw.setup({
				icons = {
					symlink = "",
					directory = "",
					file = "",
				},
				use_devicons = true,
				mappings = {},
			})
		end,
	},
}
