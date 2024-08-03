local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<ESC>"] = actions.close
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_cursor {}
    },
  }
}

require("telescope").load_extension("ui-select")

vim.api.nvim_set_keymap('n', '<leader>p', '<CMD>Telescope find_files<CR>', { silent = true, noremap = true })
