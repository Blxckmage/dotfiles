local status, staline = pcall(require, "staline")
if not status then
	return
end

staline.setup({
	sections = {
		left = { "  ", "mode", " ", "branch", " " },
		mid = { "file_name" },
		right = { "lsp", "  ", "line_column" },
	},
	mode_colors = {
		i = "#d4be98",
		n = "#84a598",
		c = "#8fbf7f",
		v = "#fc802d",
	},
	defaults = {
		true_colors = true,
		line_column = " [%l/%L] :%c  ",
		branch_symbol = " ",
	},
})
