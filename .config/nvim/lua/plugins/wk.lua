return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function()
		local wk = require("which-key")
		wk.add({
			"<leader>oi",
			desc = "List GitHub Issues",
			group = "octo",
		})
		wk.add({
			"<leader>op",
			desc = "List GitHub PullRequests",
			group = "octo",
		})
		wk.add({
			"<leader>od",
			desc = "List GitHub Discussions",
			group = "octo",
		})
		wk.add({
			"<leader>on",
			desc = "List GitHub Notifications",
			group = "octo",
		})
		wk.add({
			"<leader>os",
			desc = "Search GitHub",
			group = "octo",
		})
		wk.add({
			"<leader>f",
			desc = "Smart Find Files",
		})
		wk.add({
			"<leader>b",
			desc = "Buffers",
		})
		wk.add({
			"<leader>g",
			desc = "Grep",
		})
		wk.add({
			"<leader>n",
			desc = "Notification History",
		})
		wk.add({
			"gd",
			desc = "Goto Definition",
		})
		wk.add({
			"gr",
			nowait = true,
			desc = "References",
		})
		wk.add({
			"<leader>ss",
			desc = "LSP Symbols",
		})
		wk.add({
			"gI",
			desc = "Goto Implementation",
		})
		wk.add({
			"<leader>st",
			desc = "Todo",
		})
		wk.add({
			"<leader>d",
			desc = "Diagnostics",
		})
	end,
}
