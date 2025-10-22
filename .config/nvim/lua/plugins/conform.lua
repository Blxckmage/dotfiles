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
			-- javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
			-- typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
			-- javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			-- typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			-- css = { "biome", "prettierd", "prettier", stop_after_first = true },
			-- html = { "biome", "prettier", stop_after_first = true },
			-- json = { "biome", "prettierd", "prettier", stop_after_first = true },
			javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
			javascriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			typescriptreact = { "biome", "prettierd", "prettier", stop_after_first = true },
			css = { "biome", "prettierd", "prettier", stop_after_first = true },
			html = { "prettierd", "prettier", stop_after_first = true },
			json = { "biome", "prettierd", "prettier", stop_after_first = true },
			yaml = { "prettierd", "prettier", stop_after_first = true },
			markdown = { "prettierd", "prettier", stop_after_first = true },
			lua = { "stylua" },
			python = { "black" },
			c = { "clang_format" },
		},
		formatters = {
			black = {
				prepend_args = { "--fast" },
			},
			biome = {
				append_args = { "--write" },
			},
		},
	},
}
