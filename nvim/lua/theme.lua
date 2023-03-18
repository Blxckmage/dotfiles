local status, catppuccin = pcall(require, "catppuccin")
if not status then
	return
end

catppuccin.setup({
	flavour = "mocha",
	transparent_background = true,
	term_colors = true,

	no_italic = true,
	no_bold = true,
})

vim.cmd("colorscheme catppuccin")
