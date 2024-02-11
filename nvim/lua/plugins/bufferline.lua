return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	lazy = true,
	keys = {
		{ "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next bufffer" },
		{ "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
	},
	opts = {
		options = {
			mode = "tabs",
			separator_style = "thin",
			always_show_bufferline = false,
			show_buffer_close_icons = false,
			show_close_icon = false,
			color_icons = true,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
