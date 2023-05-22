local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	return
end

nvim_tree.setup({
	actions = {
		use_system_clipboard = true,
	},
	log = {
		enable = false,
		types = { git = false },
	},
	sort_by = "case_sensitive",
	sync_root_with_cwd = true,
	view = {
		side = "right",
		width = 30,
	},
	filters = {
		dotfiles = true,
	},
	renderer = {
		group_empty = true,
		icons = {
			git_placement = "after",
			modified_placement = "after",
			glyphs = {
				git = {
					-- Git style symbols
					unstaged = "U",
					staged = "A",
					unmerged = "M",
					renamed = "R",
					untracked = "?",
					deleted = "R",
					ignored = "!",
				},
			},
		},
	},
})

vim.keymap.set("n", "<Leader>-", ":NvimTreeToggle<CR>", { silent = true })
