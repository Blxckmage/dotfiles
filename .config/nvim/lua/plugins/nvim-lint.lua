require("util.event").lazy_file()

return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	-- event = "LazyFile",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			lua = { "luacheck" },
			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },
			svelte = { "eslint" },
			python = { "flake8" },
		},
		linters = {},
	},
	config = function(_, opts)
		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		-- Wrap eslint to ignore "No ESLint configuration found" errors
		lint.linters.eslint = require("lint.util").wrap(lint.linters.eslint, function(diagnostic)
			if diagnostic.message:find("Error: Could not find config file") or diagnostic.message:find("No ESLint configuration found") then
				return nil
			end
			return diagnostic
		end)

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
			group = vim.api.nvim_create_augroup("lint", { clear = true }),
			callback = function()
				lint.try_lint()
			end,
		})
	end,
}
