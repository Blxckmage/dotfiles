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

	local capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	}

	capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

	local servers = {
		lua_ls = {},
		html = {
			filetypes = { "html", "twig", "hbs" },
		},
		cssls = {},
		ts_ls = {},
		biome = {},
		tailwindcss = {},
	}

	for server, server_opts in pairs(servers) do
		server_opts.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server_opts.capabilities or {})

		vim.lsp.config(server, server_opts)
		vim.lsp.enable(server)
	end
end

return M
