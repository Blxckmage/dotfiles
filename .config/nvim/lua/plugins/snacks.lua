return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		picker = {
			enabled = true,
			sources = {
				explorer = {
					layout = { layout = { position = "right" } },
				},
			},
		},
		explorer = { enabled = true },
		words = { enabled = false },
		quickfile = { enabled = true },
		bigfile = { enabled = true },
		terminal = {
			win = {
				position = "bottom",
				height = 0.35,
				border = "top",
				wo = {
					winbar = "",
					winblend = 0,
				},
			},
		},
		-- disabled: conflicts with existing plugins
		notifier = { enabled = false }, -- noice.nvim handles this
		indent = { enabled = false }, -- mini.indentscope handles this
		scope = { enabled = false }, -- mini.indentscope handles this
		dashboard = { enabled = false }, -- mini.starter handles this
		bufdelete = { enabled = false }, -- mini.bufremove handles this (wired into bufferline)
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
	},
	keys = {
		-- preserve existing telescope keymaps
		{
			"\\\\",
			function()
				Snacks.picker.buffers({ layout = "dropdown" })
			end,
			desc = "Find Buffers (Snacks)",
		},
		{
			"sf",
			function()
				Snacks.explorer({
					preset = "sidebar",
					preview = false,
				})
			end,
			desc = "File Explorer (Snacks)",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.lines({ layout = "ivy" })
			end,
			desc = "Fuzzy search in current buffer (Snacks)",
		},
		{
			"sr",
			function()
				Snacks.picker.recent({ layout = "dropdown" })
			end,
			desc = "Find Recent Files (Snacks)",
		},
		{
			"se",
			function()
				Snacks.picker.diagnostics({ layout = "telescope" })
			end,
			desc = "Diagnostics (Snacks)",
		},
		{
			"sc",
			function()
				vim.api.nvim_exec_autocmds("User", { pattern = "ColorSchemeLoad" })
				Snacks.picker.colorschemes({ layout = "dropdown" })
			end,
			desc = "Colorscheme (Snacks)",
		},
		{
			"sm",
			function()
				Snacks.picker.keymaps({ layout = "ivy" })
			end,
			desc = "Keymaps (Snacks)",
		},
		-- LSP pickers (global, overrides buffer-local gd in handlers.lua)
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions({ layout = "telescope" })
			end,
			desc = "Goto Definition (Snacks)",
		},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations({ layout = "telescope" })
			end,
			desc = "Goto Declaration (Snacks)",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references({ layout = "telescope" })
			end,
			nowait = true,
			desc = "References (Snacks)",
		},
		{
			"gI",
			function()
				Snacks.picker.lsp_implementations({ layout = "telescope" })
			end,
			desc = "Goto Implementation (Snacks)",
		},
		{
			"gy",
			function()
				Snacks.picker.lsp_type_definitions({ layout = "telescope" })
			end,
			desc = "Goto Type Definition (Snacks)",
		},
		{
			"<leader>ss",
			function()
				Snacks.picker.lsp_symbols({ layout = "telescope" })
			end,
			desc = "LSP Symbols (Snacks)",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols({ layout = "telescope" })
			end,
			desc = "LSP Workspace Symbols (Snacks)",
		},
		{
			"<leader>T",
			function()
				Snacks.terminal()
			end,
			desc = "Toggle Terminal (Snacks)",
		},
		{
			"<leader>z",
			function()
				Snacks.zen({ win = { width = 200 } })
			end,
		},
		{
			"<leader>Z",
			function()
				Snacks.zen.zoom()
			end,
		},
	},
}
