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
	{
		"stevearc/oil.nvim",
		opts = {},
		config = function()
			require("oil").setup({
				columns = {
					"icon",
					"size",
				},
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-s>"] = "actions.select_vsplit",
					["<C-h>"] = "actions.select_split",
					["<C-t>"] = "actions.select_tab",
					["<C-p>"] = "actions.preview",
					["<C-c>"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = "actions.tcd",
					["g."] = "actions.toggle_hidden",
				},
			})

			vim.keymap.set("n", "<Leader>=", require("oil").open, { desc = "Open parent directory" })
		end,
	},
}
