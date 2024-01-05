return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = require("plugins.themes.tokyonight"),
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = require("plugins.themes.catppuccin"),
	},
	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
		priority = 1000,
		opts = require("plugins.themes.rose_pine"),
	},
}
