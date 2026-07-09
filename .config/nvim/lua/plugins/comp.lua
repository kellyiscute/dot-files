return {
	"hrsh7th/nvim-cmp",
	version = false,
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"petertriho/cmp-git",
	},
	opts = function()
		vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

		local cmp = require("cmp")
		return {
			snippet = {
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body)
				end,
			},
			preselect = cmp.PreselectMode.Item,
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-c>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				-- ["<tab>"] = function(fallback)
				--   return cmp.map({ "snippet_forward", "ai_nes", "ai_accept" }, fallback)()
				-- end,
			}),
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 2000000 },
				{ name = "vsnip", priority = 100 }, -- For vsnip users.
				{ name = "path", priority = 80 },
			}, {
				{ name = "buffer", priority = -10000, max_item_count = 2 },
			}),
			performance = {
				throttle = 10,
			},
		}
	end,
	init = function()
		local cmp = require("cmp")
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" },
			}),
		})
		cmp.setup.filetype("terraform", {
			completion = {
				keyword_pattern = [[\%(\k\|\.\|"\)\+]],
			},
		})
	end,
}
