local M = {}

M.setup = function(_, opts)
	local lspconfig = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")
	local cmp = require("blink.cmp")

	-- Keymaps for LSP actions
	vim.api.nvim_create_autocmd("LspAttach", {
		desc = "LSP Keymaps",
		callback = function(event)
			local function map(mode, keys, func, desc)
				vim.keymap.set(mode, keys, func, {
					buffer = event.buf,
					noremap = true,
					silent = true,
					desc = desc .. " (LSP)",
				})
			end

			map("n", "gd", vim.lsp.buf.definition, "Go to definition")
			map("n", "K", vim.lsp.buf.hover, "Show hover")
			map("n", "grn", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
			map("n", "<C-j>", vim.diagnostic.goto_next, "Next diagnostic")
			map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")
		end,
	})

	-- Capabilities
	local capabilities = vim.tbl_deep_extend("force", {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	}, cmp.get_lsp_capabilities({}, false))

	local servers = {
		lua_ls = {},
	}

	mason.setup({})
	mason_lspconfig.setup({
		handlers = {
			function(server_name)
				local server_opts = servers[server_name] or {}
				server_opts.capabilities =
					vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})
				lspconfig[server_name].setup(server_opts)
			end,
		},
	})
end

return M
