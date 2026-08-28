return {
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
					Snacks.picker.yanky()
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
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		version = "1.*",
		opts = {},
	},
	{
		"nvim-orgmode/orgmode",
		event = "BufReadPre",
		ft = { "org" },
		keys = {
			{ "<leader>oa", "<cmd>Org agenda<cr>", desc = "Agenda (Orgmode)" },
			{ "<leader>oc", "<cmd>Org capture<cr>", desc = "Capture (Orgmode)" },
		},
		init = function()
			vim.keymap.set("n", "<leader>oa", "<cmd>Org agenda<cr>", { desc = "Agenda (Orgmode)" })
			vim.keymap.set("n", "<leader>oc", "<cmd>Org capture<cr>", { desc = "Capture (Orgmode)" })
		end,
		config = function()
			require("orgmode").setup({
				org_agenda_files = "~/notes/org/*.org",
				org_default_notes_file = "~/notes/org/inbox.org",
			})

			vim.lsp.enable("org")
		end,
	},
	{
		"akinsho/org-bullets.nvim",
		ft = "org",
		config = function()
			require("org-bullets").setup()
		end,
	},
}
