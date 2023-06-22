return {
	"nvim-tree/nvim-tree.lua",
	module = true,
	cmd = {
		"NvimTreeOpen",
		"NvimTreeToggle",
		"NvimTreeFocus",
		"NvimTreeFindFile",
		"NvimTreeFindFileToggle",
	},
	config = function()
		local tree = require("nvim-tree")
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true, nowait = true }

		tree.setup({
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
				cursorline = false,
				width = 30,
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
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
	end,
}
