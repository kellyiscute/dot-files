vim.api.nvim_set_hl(0, "CursorLine", { cterm=nil, ctermbg=8, ctermfg=nil})
vim.api.nvim_set_hl(0, "CursorLineNr", { cterm=Bold, ctermbg=8 })
vim.api.nvim_set_hl(0, "Pmenu", { cterm=nil, ctermbg=Black, ctermfg=Blue })
vim.api.nvim_set_hl(0, "PmenuSel", { cterm=Bold, ctermbg=DarkGray, ctermfg=Blue })


--#region Syntax

vim.api.nvim_set_hl(0, "String", { ctermfg=DarkGreen })
vim.api.nvim_set_hl(0, "Number", { ctermfg=Blue })
vim.api.nvim_set_hl(0, "Special", { ctermfg=Blue })
vim.api.nvim_set_hl(0, "Type", { ctermfg=Green })
vim.api.nvim_set_hl(0, "Comment", { ctermfg=DarkGray })

--#endregion

vim.api.nvim_set_hl(0, "TodoBgFIX", {ctermbg=LightRed })
vim.api.nvim_set_hl(0, "TodoFgFIX", {ctermfg=Red })
vim.api.nvim_set_hl(0, "TodoSignFIX", {cterm=BOLD })
vim.api.nvim_set_hl(0, "TodoBgTODO", {ctermbg=Blue})
vim.api.nvim_set_hl(0, "TodoFgTODO", {ctermfg=LightGray })
vim.api.nvim_set_hl(0, "TodoSignTODO", {cterm=BOLD})
vim.api.nvim_set_hl(0, "TodoBgHACK", {ctermbg=DarkBlue, ctermfg=White, cterm=BOLD})
vim.api.nvim_set_hl(0, "TodoFgHACK", {ctermfg=White})
vim.api.nvim_set_hl(0, "TodoBgWARN", {ctermbg=Yellow })
vim.api.nvim_set_hl(0, "TodoSignWARN", {cterm=BOLD})
