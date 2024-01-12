return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			require("plugins.themes.tokyonight")
		end,
	},
	{
		"catppuccin/nvim",
		lazy = false,
		name = "catppuccin",
		config = function()
			require("plugins.themes.catppuccin")
		end,
	},
	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("plugins.themes.rose_pine")
		end,
	},
}
