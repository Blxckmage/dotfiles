return {
	"tamton-aquib/staline.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("staline").setup({
			sections = {
				left = { "  ", "mode", " ", "branch", " " },
				mid = { "file_name" },
				right = { "lsp", "  ", "line_column" },
			},
			mode_colors = {
				i = "#ffb86c",
				n = "#a3be8c",
				c = "#88c0d0",
				v = "#d08770",
			},
			defaults = {
				true_colors = true,
				line_column = " [%l/%L] :%c  ",
				branch_symbol = " ",
			},
		})
	end,
}