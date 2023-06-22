return {
	"nvim-treesitter/nvim-treesitter",
	module = true,
	event = { "BufReadPost", "BufNewFile" },
	cmd = {
		"TSInstall",
		"TSInstallInfo",
		"TSUpdate",
		"TSBufEnable",
		"TSBufDisable",
		"TSEnable",
		"TSDisable",
		"TSModuleInfo",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"json",
				"vim",
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"lua",
				"json",
				"rust",
				"markdown",
				"markdown_inline",
			},
			highlight = {
				enable = true,
				disable = "",
			},
			autoairs = {
				enable = true,
			},
		})
	end,
}
