local parsers = require('nvim-treesitter.parsers')

require 'nvim-treesitter.config'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true
  },
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function() pcall(vim.treesitter.start) end,
})

-- filetype detection for hypr
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
