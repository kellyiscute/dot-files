return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "arthur944/neotest-bun",
  },
  opts = {
    adapters = {
      require("neotest-bun")
    },
  },
}
