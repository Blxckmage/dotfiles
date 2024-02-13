return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = { "BufReadPost", "BufWritePost", "BufNewFile" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({})

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():append()
			vim.notify("Harpooned!", vim.log.levels.INFO)
		end, { noremap = true, silent = true, desc = "Add buffer to harpoon" })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { noremap = true, silent = true, desc = "Harpoon quick menu" })
		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { noremap = true, silent = true, desc = "Select harpoon 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { noremap = true, silent = true, desc = "Select harpoon 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { noremap = true, silent = true, desc = "Select harpoon 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { noremap = true, silent = true, desc = "Select harpoon 4" })
	end,
}
