return {
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		{
			"windwp/nvim-autopairs",
			config = function()
				local autopairs = require("nvim-autopairs")

				autopairs.setup({
					check_ts = true,
					disable_filetype = { "TelescopePrompt" },
					ts_config = {
						lua = { "string" },
						javascript = { "template_string" },
					},
				})
			end,
		},
		{
			"windwp/nvim-ts-autotag",
			config = function()
				local autotag = require("nvim-ts-autotag")

				autotag.setup({})
			end,
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		require("luasnip.loaders.from_snipmate").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets/snipmate" })
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1)),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1)),
				["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				["<C-e>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = {
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:Search",
					col_offset = -3,
					side_padding = 1,
				}),
				documentation = cmp.config.window.bordered({
					border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:Search",
					col_offset = -3,
					side_padding = 1,
				}),
			},
			experimental = {
				ghost_text = { enabled = true },
			},
		})
	end,
}