return {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	config = function()
		local rt = require("rust-tools")
		local keymap = vim.keymap
		rt.setup({
			server = {
				settings = {
					["rust-analyzer"] = {
						inlayHints = { locationLinks = false },
					},
				},
				on_attach = function(_, bufnr)
					keymap.set("n", "<leader>ha", rt.hover_actions.hover_actions, { buffer = bufnr })
					keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
		})
	end,
}
