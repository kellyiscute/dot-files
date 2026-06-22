return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function(_, opts)
			local ts = require("nvim-treesitter")
			ts.install(opts.ensure_installed)
		end,
		opts = {
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
			ensure_installed = {
				"javascript",
				"typescript",
				"json",
				"toml",
				"vim",
				"go",
				"html",
				"lua",
				"json",
				"yaml",
				"qmljs",
				"dart",
				"css",
				"scss",
				"fish",
				"bash",
				"zsh",
				"dockerfile",
				"vimdoc",
				"jsdoc",
				"java",
				"kotlin",
				"hyprlang",
				"nginx",
				"ini",
				"c",
				"cpp",
				"c_sharp",
				"caddy",
				"make",
				"markdown",
				"markdown_inline",
				"regex",
				"latex",
				"csv",
				"dart",
				"desktop",
				"gitcommit",
				"gitignore",
				"gomod",
				"gosum",
				"gotmpl",
				"http",
				"json5",
				"jinja",
				"jq",
				"python",
				"rust",
				"sql",
				"sway",
				"terraform",
				"tsx",
				"xml",
				"vue",
				"mermaid",
				"kitty",
				"helm",
				"graphql",
				"norg",
				"typst",
				"svelte",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		init = function()
			vim.g.no_plugin_maps = true
			vim.keymap.set({ "x", "o" }, "am", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "im", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end)
			-- You can also use captures from other query groups like `locals.scm`
			vim.keymap.set({ "x", "o" }, "as", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]m", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]]", function()
				require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "]M", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "][", function()
				require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[m", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[[", function()
				require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
			end)

			vim.keymap.set({ "n", "x", "o" }, "[M", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "n", "x", "o" }, "[]", function()
				require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
			end)
		end,
		opts = {
			lookahead = true,
			move = {
				set_jumps = true,
			},
		},
	},
}
