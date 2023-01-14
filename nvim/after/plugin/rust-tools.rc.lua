local status, rt = pcall(require, "rust-tools")
if not status then
	return
end

rt.setup({
	server = {
		settings = {
			["rust-analyzer"] = {
				inlayHints = { locationLinks = false },
			},
		},
		on_attach = function(_, bufnr)
			-- Hover actions
			vim.keymap.set("n", "<leader>c", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})
