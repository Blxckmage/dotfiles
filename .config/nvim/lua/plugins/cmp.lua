return {
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "1.*",
		dependencies = {
			{ "nvim-mini/mini.icons", version = false },
		},

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				preset = "none",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<Tab>"] = {
					function(cmp)
						if require("copilot.suggestion").is_visible() then
							if vim.api.nvim_get_mode().mode == "i" then
								vim.api.nvim_feedkeys(
									vim.api.nvim_replace_termcodes("<c-G>u", true, true, true),
									"n",
									false
								)
							end
							require("copilot.suggestion").accept()
						elseif cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			signature = {
				enabled = true,
			},

			completion = {
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 250,
					treesitter_highlighting = true,
				},
				menu = {
					draw = {
						columns = {
							-- { "label", "label_description", gap = 1 },
							-- { "kind" },
							{ "label", "label_description" },
							{ "kind_icon", "kind", gap = 1 },
							{ "source_name" },
						},
						components = {
							source_name = {
								text = function(ctx)
									return "[" .. ctx.source_name .. "]"
								end,
							},
						},

						treesitter = { "lsp" },
					},
				},
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					},
				},
				ghost_text = {
					enabled = true,
				},
			},
			snippets = {
				preset = "luasnip",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					cmdline = {
						min_keyword_length = function(ctx)
							if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
								return 3
							end
							return 0
						end,
					},
				},
			},
			cmdline = {
				keymap = {
					preset = "inherit",
				},
				completion = {
					menu = {
						auto_show = function(ctx)
							return vim.fn.getcmdtype() == ":"
						end,
					},
					ghost_text = {
						enabled = false,
					},
				},
			},
		},
	},
}
