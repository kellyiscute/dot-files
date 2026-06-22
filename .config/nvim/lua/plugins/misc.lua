return {
  {
    "voldikss/vim-floaterm"
  },
  {
    "brooth/far.vim"
  },
  {
    "wakatime/vim-wakatime",
  },
  {
    "lukas-reineke/indent-blankline.nvim"
  },
  {
    "terryma/vim-multiple-cursors"
  },
  {
    "nicwest/vim-camelsnek"
  },
  {
    "Asheq/close-buffers.vim"
  },
  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      width = 140,
      autocmds = {
        enableOnVimEnter = true,
      },
      buffers = {
        setNames = true,
        bo = {
          filetype = "md",
        },
        wo = {
          cursorline = true,
          relativenumber = true,
        }
      },
    },
  },
  {
    "akinsho/git-conflict.nvim"
  },
  {
    "MunifTanjim/nui.nvim",
  },
}
