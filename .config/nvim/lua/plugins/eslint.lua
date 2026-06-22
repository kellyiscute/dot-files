return {
  "esmuellert/nvim-eslint",
  opts = {
    -- enable source maps to locate where failures are happening in vscode-eslint
    handlers = {
      -- get notified if the config file failed to load
      ["eslint/noConfig"] = function(_, result)
        vim.notify(result.message, vim.log.levels.WARN)
        return {}
      end,
      -- reset diagnostics, useful with fix/format on save to clear stale diagnostics
      ["workspace/diagnostic/refresh"] = function(_, _, ctx)
        local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
        local bufnr = vim.api.nvim_get_current_buf()
        vim.diagnostic.reset(ns, bufnr)
        return true
      end,
    },
    settings = {
      codeAction = {
        disableRuleComment = {
          enable = true,
          location = 'separateLine',
        },
        showDocumentation = {
          enable = true,
        },
      },
      run = "onType",
      quiet = false,
      -- enable formatting
      format = true,
      -- had to force for my setup
      useFlatConfig = true,
      -- was having issues in a monorepo finding the config without this
      workingDirectories = { mode = "auto" },
      options = {
        -- enable caching
        cache = true,
      },
    },
  },
}
