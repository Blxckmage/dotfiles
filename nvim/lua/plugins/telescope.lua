return {
	"nvim-telescope/telescope.nvim",
	module = true,
	lazy = true,
	cmd = "Telescope",
	dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
	keys = {
		{
			"\\\\",
			function()
				require("telescope.builtin").buffers()
			end,
		},
		{
			"sf",
			function()
				require("telescope").extensions.file_browser.file_browser({
					path = "%:p:h",
					cwd = vim.fn.expand("%:p:h"),
					respect_gitignore = false,
					hidden = true,
					grouped = true,
					previewer = true,
					initial_mode = "normal",
					layout_config = { height = 20 },
				})
			end,
		},
		{
			"s/",
			function()
				require("telescope.builtin").live_grep()
			end,
		},
		{
			"sd",
			function()
				require("telescope.builtin").find_files({
					no_ignore = false,
					hidden = true,
				})
			end,
		},
		{
			"sr",
			function()
				require("telescope.builtin").oldfiles()
			end,
		},
		{
			"se",
			function()
				require("telescope.builtin").diagnostics()
			end,
		},
		{
			"sc",
			function()
				require("telescope.builtin").colorscheme()
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local fb_actions = require("telescope").extensions.file_browser.actions

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["q"] = actions.close,
					},
				},
			},
			extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = false,
					mappings = {
						["i"] = {
							["<C-w>"] = function()
								vim.cmd("normal vbd")
							end,
						},
						["n"] = {
							["N"] = fb_actions.create,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
						},
					},
				},
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
			},
		})

		telescope.load_extension("file_browser")
	end,
}
