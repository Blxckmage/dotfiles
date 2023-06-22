return {
	"phaazon/hop.nvim",
	branch = "v2",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		local hop = require("hop")
		local keymap = vim.keymap

		hop.setup({
			keys = "etovxqpdygfblzhckisuran",
		})

		keymap.set("", "<Leader>a", function()
			hop.hint_anywhere()
		end, { remap = true })
		keymap.set("", "<Leader>w", function()
			hop.hint_words()
		end, { remap = true })

		keymap.set("", "<Leader>l", function()
			hop.hint_lines()
		end, { remap = true })

		keymap.set("", "<Leader>r", function()
			hop.hint_char2()
		end, { remap = true })

		keymap.set("", "<Leader>p", function()
			hop.hint_patterns()
		end, { remap = true })
	end,
}
