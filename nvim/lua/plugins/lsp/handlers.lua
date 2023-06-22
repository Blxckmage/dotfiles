local M = {}
local keymap = vim.keymap.set

M.setup = function()
	local config = {
		virtual_text = true,
		signs = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)
end

M.zero_setup = function()
	local lsp = require("lsp-zero").preset({})

	lsp.ensure_installed({
		"tsserver",
		"eslint",
		"lua_ls",
		"rust_analyzer",
		"cssls",
		"html",
	})
	lsp.set_preferences({
		sign_icons = {},
	})
	lsp.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, silent = true }
		local keymap = vim.keymap

		keymap.set("n", "<C-j>", ":Lspsaga diagnostic_jump_next<CR>", opts)
		keymap.set("n", "gD", ":Lspsaga lsp_finder<CR>", opts)
		keymap.set("n", "gd", ":Lspsaga goto_definition<CR>", opts)
		keymap.set("n", "gl", ":Lspsaga show_line_diagnostics<CR>", opts)
		keymap.set("n", "gc", ":Lspsaga show_cursor_diagnostics<CR>", opts)
		keymap.set("n", "gp", ":Lspsaga peek_definition<CR>", opts)
		keymap.set("n", "gt", ":Lspsaga term_toggle<CR>", opts)
		keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		keymap.set("n", "<Leader>ca", ":Lspsaga code_action<CR>", opts)
	end)

	lsp.setup()
end

M.saga_setup = function()
	local lspsaga = require("lspsaga")

	lspsaga.setup({
		server_filetype_map = {},
	})
end

return M
