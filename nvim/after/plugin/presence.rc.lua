local status, presence = pcall(require, "presence")
if not status then
	return
end

presence:setup({
	neovim_image_text = "One Text Editor To Rule Them All",
	main_image = "file",
})
