local M = {}

M.zero_setup = function()
	local lsp_zero = require("lsp-zero")
	lsp_zero.extend_lspconfig()

	lsp_zero.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "grn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>ca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<C-j>", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end)
end

M.lsp_setup = function()
	local config = {
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

M.mason_setup = function()
	local lspconfig = require("lspconfig")

	local auto_install = {
		"lua_ls",
		"cssls",
		"html",
		"tsserver",
		"eslint",
		"rust_analyzer",
	}

	require("mason").setup({
		ui = {
			check_outdated_packages_on_open = false,
			border = "rounded",
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = " ",
			},
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = auto_install,
		handlers = {
			require("lsp-zero").default_setup,
		},
	})

	require("mason-lspconfig").setup_handlers({
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
end

return M
