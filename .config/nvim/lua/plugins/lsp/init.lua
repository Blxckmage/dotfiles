require("util.event").lazy_file()

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "williamboman/mason.nvim", cmd = "Mason", build = ":MasonUpdate", config = true },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function(_, opts)
		require("plugins.lsp.handlers").setup(_, opts)
	end,
}
