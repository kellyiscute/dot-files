return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"antoinemadec/FixCursorHold.nvim",
		"marilari88/neotest-vitest",
		"arthur944/neotest-bun",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-vitest"),
				-- require("neotest-bun"),
			},
		})
	end,
}
