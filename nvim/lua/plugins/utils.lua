return {
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
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
		"gbprod/yanky.nvim",
		recommended = true,
		desc = "Better Yank/Paste",
		event = "LazyFile",
		opts = {
			highlight = { timer = 150 },
		},
		keys = {
			{
				"<leader>p",
				function()
					require("telescope").extensions.yank_history.yank_history({})
				end,
				mode = { "n", "x" },
				desc = "Open Yank History (Yanky)",
			},
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank Text (Yanky)" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put Text After Cursor (Yanky)" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Cursor (Yanky)" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put Text After Selection (Yanky)" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put Text Before Selection (Yanky)" },
			{ "[y", "<Plug>(YankyCycleForward)", desc = "Cycle Forward Through Yank History (Yanky)" },
			{ "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle Backward Through Yank History (Yanky)" },
			{ "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise) (Yanky)" },
			{ "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise) (Yanky)" },
			{ "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put Indented After Cursor (Linewise) (Yanky)" },
			{ "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put Indented Before Cursor (Linewise) (Yanky)" },
			{ ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and Indent Right (Yanky)" },
			{ "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and Indent Left (Yanky)" },
			{ ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put Before and Indent Right (Yanky)" },
			{ "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put Before and Indent Left (Yanky)" },
			{ "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put After Applying a Filter (Yanky)" },
			{ "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put Before Applying a Filter (Yanky)" },
		},
	},
}
