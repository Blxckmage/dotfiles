return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			style = "night",
			transparent = true,
			terminal_colors = true,
		},
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			transparent_background = true,
			term_colors = true,
			styles = {
				keywords = { "italic" },
				variables = { "italic" },
				booleans = { "italic" },
				properties = { "italic" },
			},
			integrations = {
				cmp = true,
				nvimtree = true,
				telescope = {
					enabled = true,
				},
				treesitter_context = false,
				treesitter = true,
				dashboard = true,
				mini = {
					enabled = true,
					indentscope_color = "lavender",
				},
				native_lsp = {
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		},
	},
	{
		"rose-pine/neovim",
		lazy = true,
		name = "rose-pine",
		priority = 1000,
		opts = {
			variant = "auto",
			dark_variant = "main",
		},
	},
}