return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
		config = function(_, opts)
			require("plugins.lsp.handlers").setup(_, opts)
		end,
	},
}
