return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {},
		config = function()
			require("plugins.lsp.handlers").zero_setup()
		end,
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		config = function()
			require("plugins.lsp.handlers").lsp_setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig",
		},
		config = function()
			require("plugins.lsp.handlers").mason_setup()
		end,
	},
}
