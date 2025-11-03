return {
	filetypes = { "python" },
	cmd = { "ruff", "server", "--preview" },
	settings = {
		-- Configuration for Ruff
		configuration = vim.fn.getcwd() .. "/pyproject.toml",
		-- Enable organize imports code action
		organizeImports = true,
		-- Enable fix all code action
		fixAll = true,
		lint = {
			-- Enable linting
			enable = true,
			-- Select rules (can be customized)
			select = { "ALL" },
			-- Ignore specific rules
			ignore = {
				"E501", -- Line too long (let formatter handle it)
				"D", -- Docstring rules (disable if you don't want docstring checks)
			},
		},
		format = {
			-- Enable formatting
			enable = true,
		},
	},
}
