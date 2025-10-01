return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "BufReadPost",
	build = ":Copilot auth",
	opts = {
		suggestion = {
			keymap = {
				accept = false,
			},
			enabled = not vim.g.ai_cmp,
			auto_trigger = true,
		},
		panel = {
			enabled = true,
			auto_refresh = false,
		},
		filetypes = {
			markdown = true,
		},
	},
}
