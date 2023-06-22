return {
	"akinsho/bufferline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local bufferline = require("bufferline")
		local keymap = vim.keymap

		bufferline.setup({
			options = {
				mode = "tabs",
				separator_style = "thin",
				always_show_bufferline = false,
				show_buffer_close_icons = false,
				show_close_icon = false,
				color_icons = true,
			},
		})

		keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", {})
		keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", {})
	end,
}
