return {
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "standard",
				diagnosticMode = "workspace",
				useLibraryCodeForTypes = true,
				autoSearchPaths = true,
				autoImportCompletions = true,
				-- Disable Pyright's linting rules that overlap with Ruff
				diagnosticSeverityOverrides = {
					reportUnusedImport = "none",
					reportUnusedVariable = "none",
				},
			},
		},
	},
}
