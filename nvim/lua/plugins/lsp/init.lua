return {
	{
		-- NOTE: Might remove lsp-zero :/
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{
				"neovim/nvim-lspconfig",
				event = { "BufReadPre", "BufNewFile" },
				cmd = { "LspInfo", "LspInstall", "LspUninstall" },
				config = function()
					require("plugins.lsp.handlers").setup()
				end,
			},
		},
		config = function()
			require("plugins.lsp.handlers").zero_setup()
		end,
	},
	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("plugins.lsp.handlers").saga_setup()
		end,
	},
	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
		},
		build = function()
			pcall(vim.cmd, "MasonUpdate")
		end,
	},
	{ "williamboman/mason-lspconfig.nvim" },
}
