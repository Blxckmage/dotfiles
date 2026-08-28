return {
	"dmtrKovalenko/fff.nvim",
	-- ponytail: download prebuilt (fast, no 268 derivations) + guard $HOME sigsegv
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	cond = function() return vim.fn.getcwd() ~= vim.fn.expand("~") and vim.fn.getcwd() ~= "/" end,
	opts = {
		debug = {
			enabled = true,
			show_scores = true,
		},
	},
	lazy = false,
	keys = {
		{
			"ff",
			function()
				require("fff").find_files()
			end,
			desc = "Find Files (fff)",
		},
		{
			"fg",
			function()
				require("fff").live_grep()
			end,
			desc = "Live Grep (fff)",
		},
		{
			"fz",
			function()
				require("fff").live_grep({
					grep = {
						modes = { "fuzzy", "plain" },
					},
				})
			end,
			desc = "Fuzzy Search (fff)",
		},
		{
			"fc",
			function()
				require("fff").live_grep({ query = vim.fn.expand("<cword>") })
			end,
			desc = "Search Current Word (fff)",
		},
	},
}
