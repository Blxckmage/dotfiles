return {
	"stevearc/oil.nvim",
	event = "VimEnter",
	keys = {
		{
			"<Leader>=",
			function()
				require("oil").open()
			end,
		},
	},
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
	end,
}
