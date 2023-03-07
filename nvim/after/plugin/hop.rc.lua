local status, hop = pcall(require, "hop")
if not status then
	return
end

hop.setup({
	keys = "etovxqpdygfblzhckisuran",
})

vim.keymap.set("", "<Leader>a", function()
	hop.hint_anywhere()
end, { remap = true })
vim.keymap.set("", "<Leader>w", function()
	hop.hint_words()
end, { remap = true })

vim.keymap.set("", "<Leader>l", function()
	hop.hint_lines()
end, { remap = true })

vim.keymap.set("", "<Leader>r", function()
	hop.hint_char2()
end, { remap = true })

vim.keymap.set("", "<Leader>p", function()
	hop.hint_patterns()
end, { remap = true })
