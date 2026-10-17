vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cursorline = true
vim.g.airline_theme = 'catppuccin'

--vim.api.nvim_set_hl(0, )
--
--const hist =  
--});

require('highlight')
require('lazyLoader')
require('plugins')
require('keybindings')
Lazy = require('lazy')
Lazy.setup(Plugins)

vim.cmd('colorscheme tokyonight-storm')

require("nvim-tree").setup({
})
