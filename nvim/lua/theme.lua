local status, catppuccin = pcall(require, "catppuccin")
if not status then
	return
end

catppuccin.setup({
	flavour = "mocha",
	transparent_background = true,
	show_end_of_buffer = true,
	term_colors = true,

	no_italic = true,
	no_bold = true,
})

vim.cmd("colorscheme catppuccin")
