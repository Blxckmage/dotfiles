return {
	{
		"echasnovski/mini.pairs",
		event = "InsertEnter",
		version = false,
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPost", "BufNewFile", "BufWritePre" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"help",
					"alpha",
					"lazy",
					"mason",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"echasnovski/mini.comment",
		keys = {
			{ "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
			{ "gcc", mode = "n", desc = "Comment toggle current line" },
			{ "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
		},
		opts = {
			options = {
				custom_commentstring = function()
					return require("ts_context_commentstring.internal").calculate_commentstring()
						or vim.bo.commentstring
				end,
			},
		},
	},
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function()
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			local animate = require("mini.animate")
			return {
				resize = {
					timing = animate.gen_timing.linear({ duration = 100, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
								return false
							end
							return total_scroll > 1
						end,
					}),
				},
				open = {
					enable = false,
				},
				close = {
					enable = false,
				},
			}
		end,
	},
	{
		"echasnovski/mini.surround",
		keys = function(_, keys)
			local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
			local opts = require("lazy.core.plugin").values(plugin, "opts", false)
			local mappings = {
				{ opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
				{ opts.mappings.delete, desc = "Delete surrounding" },
				{ opts.mappings.find, desc = "Find right surrounding" },
				{ opts.mappings.find_left, desc = "Find left surrounding" },
				{ opts.mappings.highlight, desc = "Highlight surrounding" },
				{ opts.mappings.replace, desc = "Replace surrounding" },
				{ opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
			}
			mappings = vim.tbl_filter(function(m)
				return m[1] and #m[1] > 0
			end, mappings)
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>bd",
				function()
					local bd = require("mini.bufremove").delete
					if vim.bo.modified then
						local choice =
							vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
						if choice == 1 then
							vim.cmd.write()
							bd(0)
						elseif choice == 2 then
							bd(0, true)
						end
					else
						bd(0)
					end
				end,
				desc = "Delete Buffer",
			},
			{
				"<leader>bD",
				function()
					require("mini.bufremove").delete(0, true)
				end,
				desc = "Delete Buffer (Force)",
			},
		},
	},
	{
		"echasnovski/mini.starter",
		version = false,
		lazy = true,
		event = "VimEnter",
		opts = function()
			local logo = [[
     ▄▄▄▄    ██▓    ▄▄▄       ▄████▄   ██ ▄█▀ ███▄ ▄███▓ ▄▄▄        ▄████ ▓█████
    ▓█████▄ ▓██▒   ▒████▄    ▒██▀ ▀█   ██▄█▒ ▓██▒▀█▀ ██▒▒████▄     ██▒ ▀█▒▓█   ▀
    ▒██▒ ▄██▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▓██    ▓██░▒██  ▀█▄  ▒██░▄▄▄░▒███
    ▒██░█▀  ▒██░   ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄ ▒██    ▒██ ░██▄▄▄▄██ ░▓█  ██▓▒▓█  ▄
    ░▓█  ▀█▓░██████▒▓█   ▓██▒▒ ▓███▀ ░▒██▒ █▄▒██▒   ░██▒ ▓█   ▓██▒░▒▓███▀▒░▒████▒
    ░▒▓███▀▒░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░ ▒░   ░  ░ ▒▒   ▓▒█░ ░▒   ▒ ░░ ▒░ ░
    ▒░▒   ░ ░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░░  ░      ░  ▒   ▒▒ ░  ░   ░  ░ ░  ░
     ░    ░   ░ ░    ░   ▒   ░        ░ ░░ ░ ░      ░     ░   ▒   ░ ░   ░    ░
     ░          ░  ░     ░  ░░ ░      ░  ░          ░         ░  ░      ░    ░  ░
          ░                  ░
    ]]
			local starter = require("mini.starter")
			local config = {
				evaluate_single = true,
				header = logo,
				items = {
					{ name = "Find File", action = ":Telescope find_files", section = "Telescope" },
					{ name = "Grep Text", action = ":Telescope live_grep", section = "Telescope" },
					{ name = "Recent Files", action = ":Telescope oldfiles", section = "Telescope" },
					starter.sections.recent_files(5, false),
					{ name = "Lazy", action = ":Lazy", section = "Lazy" },
					{ name = "New File", action = ":ene | startinsert", section = "Built-in" },
					{ name = "Quit", action = ":qa", section = "Built-in" },
				},
				content_hooks = {
					starter.gen_hook.adding_bullet("░ "),
					starter.gen_hook.indexing("all", { "Telescope", "Recent files", "Lazy", "Built-in" }),
					starter.gen_hook.aligning("center", "center"),
					starter.gen_hook.padding(0, 1),
				},
				query_updaters = [[abcdefghijklmnopqrstuvwxyz0123456789_-.]],
				footer = "",
			}
			return config
		end,
		config = function(_, config)
			local starter = require("mini.starter")
			starter.setup(config)
		end,
	},
}
