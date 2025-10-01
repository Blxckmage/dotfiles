require("util.event").lazy_file()

return {
	{
		"mason-org/mason-lspconfig.nvim",
		event = "LazyFile",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "mason-org/mason.nvim", cmd = "Mason", build = ":MasonUpdate" },
		},
		config = function(_, opts)
			require("plugins.lsp.handlers").setup(_, opts)
		end,
	},
}
