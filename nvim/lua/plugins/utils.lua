return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TodoLocList", "TodoTelescope", "TodoQuickFix", "TodoTrouble" },
		opts = {
			signs = true,
			sign_priority = 8,
			keywords = {
				FIX = {
					icon = " ",
					color = "error",
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
				},
				TODO = { icon = " ", color = "info" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				PERF = { icon = "󰥔 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
				NOTE = { icon = "󱞁 ", color = "hint", alt = { "INFO" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		},
	},
	{
		"vyfor/cord.nvim",
		build = "./build",
		event = "VeryLazy",
		opts = {
			editor = {
				tooltip = "One Text Editor To Rule Them All",
			},
		},
	},
}
