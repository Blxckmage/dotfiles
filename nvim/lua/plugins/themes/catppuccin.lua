return {
	flavour = "mocha",
	transparent_background = true,
	term_colors = true,
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
			enabled = true,
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
}
