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
		dependencies = "williamboman/mason-lspconfig.nvim",
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")

			local auto_install = {
				"lua_ls",
				"cssls",
				"html",
				"tsserver",
			}

			mason.setup({
				ui = {
					-- Whether to automatically check for new versions when opening the :Mason window.
					check_outdated_packages_on_open = false,
					border = "rounded",
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = " ",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = auto_install,
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					local opts = {
						on_attach = require("plugins.lsp.handlers").on_attach,
						capabilities = require("plugins.lsp.handlers").capabilities,
					}

					local require_ok, server = pcall(require, "plugins.lsp.settings." .. server_name)
					if require_ok then
						opts = vim.tbl_deep_extend("force", server, opts)
					end

					lspconfig[server_name].setup(opts)
				end,
			})
		end,
	},
}
