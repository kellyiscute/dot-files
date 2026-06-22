return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = '*',
        callback = function() pcall(vim.treesitter.start) end,
      })

      -- filetype detection for hypr
      vim.filetype.add({
        pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
      })
    end,
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true
      },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    init = function()
      vim.g.no_plugin_maps = true
    end,
    opts = {
      lookahead = true,
    }
  }
}
