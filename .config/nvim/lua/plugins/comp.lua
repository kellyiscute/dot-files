local kind_icons = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

return {
	"hrsh7th/nvim-cmp",
	version = false,
	lazy = false,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-calc",
		"petertriho/cmp-git",
		"hrsh7th/cmp-nvim-lsp-signature-help",
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
				{ name = "nvim_lsp_signature_help", priority = 300 },
				{ name = "nvim_lua", priority = 200 },
				{ name = "vsnip", priority = 100 }, -- For vsnip users.
				{ name = "path", priority = 80 },
				{ name = "calc" },
			}, {
				{ name = "buffer", priority = -10000, max_item_count = 2 },
			}),
			formatting = {
        fields = { "kind", "abbr" },
				format = function(entry, vim_item)
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
					return vim_item
				end,
			},
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
