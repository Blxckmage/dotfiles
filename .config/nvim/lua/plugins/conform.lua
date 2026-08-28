return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	lazy = true,
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		format_on_save = {
			timeout_ms = 500,
			async = false,
			lsp_format = "fallback",
		},
		-- format_after_save = {
		-- 	lsp_format = "fallback",
		-- },
		formatters_by_ft = {
			javascript = { "prettier", "biome", stop_after_first = true },
			typescript = { "prettier", "biome", stop_after_first = true },
			javascriptreact = { "prettier", "biome", stop_after_first = true },
			typescriptreact = { "prettier", "biome", stop_after_first = true },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier", "biome", stop_after_first = true },
			jsonc = { "prettier", "biome", stop_after_first = true },
			yaml = { "prettier" },
			markdown = { "prettier" },
			lua = { "stylua" },
			python = { "black" },
			nix = { "nixfmt" },
			c = { "clang_format" },
			php = { "php-cs-fixer" },
		},
		formatters = {
			black = {
				prepend_args = { "--fast" },
			},
		},
	},
}
