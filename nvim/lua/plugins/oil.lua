return {
	"stevearc/oil.nvim",
	cmd = "Oil",
	keys = {
		{
			"<Leader>=",
			function()
				require("oil").open()
			end,
			desc = "Open Oil",
		},
		{
			"<Leader>o",
			function()
				require("oil").open_float()
			end,
			desc = "Open Oil(float)",
		},
	},
	opts = {
		default_file_explorer = false,
		view_options = {
			show_hidden = false,
		},
		columns = {
			"icon",
			"size",
		},
		float = {
			padding = 2,
			max_height = math.ceil(vim.o.lines * 0.8 - 4),
			max_width = math.ceil(vim.o.columns * 0.4),
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<C-s>"] = "actions.select_vsplit",
			["<C-h>"] = "actions.select_split",
			["<C-t>"] = "actions.select_tab",
			["<C-p>"] = "actions.preview",
			["<C-l>"] = "actions.refresh",
			["-"] = "actions.parent",
			["_"] = "actions.open_cwd",
			["`"] = "actions.cd",
			["~"] = "actions.tcd",
			["g."] = "actions.toggle_hidden",
			["q"] = "actions.close",
		},
	},
}
