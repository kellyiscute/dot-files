require("no-neck-pain").setup {
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
}
