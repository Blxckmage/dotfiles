return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "jay-babu/mason-null-ls.nvim", event = { "BufReadPre", "BufNewFile" } },
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")
		local diagnostics = null_ls.builtins.diagnostics
		local formatting = null_ls.builtins.formatting

		-- Primary source is mason
		mason_null_ls.setup({
			ensure_installed = {
				"stylua",
				"prettier",
				"prettierd",
			},
			automatic_installation = true,
			handlers = {},
		})

		null_ls.setup({
			debug = false,
			sources = {
				formatting.prettier.with({
					extra_filetypes = { "toml", "solidity" },
				}),
				diagnostics.eslint_d.with({
					condition = function(utils)
						return utils.root_has_file(".eslintrc.js")
					end,
				}),
				formatting.clang_format,
			},
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
