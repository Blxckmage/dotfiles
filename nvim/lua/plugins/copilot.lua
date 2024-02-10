return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	opts = {
		suggestion = {
			accept = false,
			enabled = true,
			auto_trigger = true,
		},
		panel = {
			enabled = true,
			auto_refresh = false,
		},
	},
}
