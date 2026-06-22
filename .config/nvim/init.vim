set number
set mouse=a
set expandtab
set autoindent
set tabstop=2
set shiftwidth=2
set hidden
set encoding=utf-8
set nobackup
set nowritebackup
set relativenumber
set updatetime=20
set cursorline

if ($TMUX != "")
  let g:clipboard = "tmux"
else
  let g:clipboard = "wl-copy"
endif

" There used to be a bug with space as leader. I don't know if it's fixed now.
nnoremap <SPACE> <Nop>
let g:mapleader = ' '

hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE
hi CursorLineNr cterm=BOLD ctermbg=8
hi Pmenu cterm=NONE ctermbg=Black ctermfg=Blue
hi PmenuSel cterm=BOLD ctermbg=DarkGray ctermfg=Blue

" Syntax
hi String ctermfg=DarkGreen
hi Number ctermfg=Blue
hi Special ctermfg=Blue
hi Type ctermfg=Green
hi Comment ctermfg=DarkGray

" Todo
hi TodoBgFIX ctermbg=LightRed 
hi TodoFgFIX ctermfg=Red 
hi TodoSignFIX cterm=BOLD 
hi TodoBgTODO ctermbg=Blue
hi TodoFgTODO ctermfg=LightGray 
hi TodoSignTODO cterm=BOLD
hi TodoBgHACK ctermbg=DarkBlue ctermfg=White cterm=BOLD
hi TodoFgHACK ctermfg=White
hi TodoBgWARN ctermbg=Yellow 
hi TodoSignWARN cterm=BOLD
hi todobgfix guibg=#bf616a guifg=#d8dee9 gui=bold
hi todobgtodo guibg=#d08770 guifg=#3b4252 gui=bold
hi todobghack guibg=#a3be8c guifg=#3b4252 gui=bold
hi todobgwarn guibg=#ebcb8b guifg=#2e3440 gui=bold

sign define DiagnosticSignError text= texthl=DiagnosticSignError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo
sign define DiagnosticSignHint text=󰌵 texthl=DiagnosticSignHint

let g:camelsnek_no_fun_allowed = 0

set winbar+=%{%v:lua.require'nvim-navic'.get_location()%}

nmap <C-j> 4j
nmap <C-k> 4k

" naming convention switching
let g:camelsnek_i_am_an_old_fart_with_no_sense_of_humour_or_internet_culture = 0
let g:camelsnek_alternative_camel_commands = 1

" find by cursor position
vnoremap \\ "vy/<C-r>v<CR>

" CamelCaseMotion
let g:camelcasemotion_key = '\'

" write
map <silent> <leader>w :w<CR>

" reload
command Reload source ~/.config/nvim/init.vim
map <leader>1 $

let g:floaterm_keymap_toggle = '<F12>'
nnoremap <silent> <F11> :FloatermNew<CR>
nnoremap <silent> <F10> :FloatermNext<CR>
nnoremap <silent> <F9> :FloatermPrev<CR>

" telescope
nnoremap <leader>S <cmd>Telescope treesitter<cr>

" player controls
nnoremap <silent> <leader>pp :silent exec "!playerctl -p spotify play-pause"<CR>
nnoremap <silent> <leader>pn :silent exec "!playerctl -p spotify next"<CR>
nnoremap <silent> <leader>pl :SpotifyPlaylist<CR>

" lsp
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap fmt <cmd>lua vim.lsp.buf.format()<cr>
nnoremap K <cmd>lua ShowDocOrDiag()<cr>

" zen mode
nnoremap <leader>z <cmd>NoNeckPain<CR>

" close-buf
command! Q :Bdelete menu<CR>

" buf jmp
nnoremap <silent> - :bprev<CR>
nnoremap <silent> = :bnext<CR>

nnoremap <silent> <leader>ee :Neotree float reveal<CR>
nnoremap <silent> <leader>eg :Neotree float git_status<CR>

function! AutoTelescope()
  let l:bufname = bufname()
  echo 'bufname' . l:bufname
  if l:bufname == ''
    Telescope find_files
  endif
endfunction

" close-buf
command! Q :Bdelete menu<CR>

" colorscheme tokyonight

" There is a reason why this is at the end of the file
hi Conceal guifg=#949494

lua require("config.lazy")

lua << EOF
  vim.api.nvim_create_autocmd('FileType', {
    pattern = '*',
    callback = function() pcall(vim.treesitter.start) end,
  })

  -- filetype detection for hypr
  vim.filetype.add({
    pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
  })
EOF
