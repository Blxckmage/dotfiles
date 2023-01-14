local status, netrw = pcall(require, "netrw")
if not status then
	return
end

netrw.setup({
	icons = {
		symlink = "",
		directory = "",
		file = "",
	},
	use_devicons = true,
	mappings = {},
})
