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
  config = function ()
    local wk = require("which-key")
    wk.add {
      "<leader>oi",
      desc = "List GitHub Issues",
      group = "octo",
    }
    wk.add {
      "<leader>op",
      desc = "List GitHub PullRequests",
      group = "octo",
    }
    wk.add {
      "<leader>od",
      desc = "List GitHub Discussions",
      group = "octo",
    }
    wk.add {
      "<leader>on",
      desc = "List GitHub Notifications",
      group = "octo",
    }
    wk.add {
      "<leader>os",
      desc = "Search GitHub",
      group = "octo",
    }
  end
}
