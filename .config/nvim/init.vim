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

" use bun
let g:node_host_prog = '/home/kelly/.bun/bin/bun'

" There used to be a bug with space as leader. I don't know if it's fixed now.
nnoremap <SPACE> <Nop>
let g:mapleader = ' '

hi CursorLine cterm=NONE ctermbg=8 ctermfg=NONE
hi CursorLineNr cterm=BOLD ctermbg=8
hi Pmenu cterm=NONE ctermbg=Black ctermfg=Blue
hi PmenuSel cterm=BOLD ctermbg=DarkGray ctermfg=Blue

" Spotify
let g:spotify_client_id = '0495bc14e11a455fb1ff2a2c2615dc9b'
let g:spotify_client_secret = 'a085aaeddfb24520889b337043ebf6c6'

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

let g:localvimrc_ask=0
let g:camelsnek_no_fun_allowed = 0 " Shorter alias for the above.
let g:airline_theme = 'tokyonight'

let g:airline_highlighting_cache = 1
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
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>S <cmd>Telescope treesitter<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>d <cmd>Telescope diagnostics<cr>
nnoremap <leader>s <cmd>Telescope lsp_document_symbols<cr>

" player controls
nnoremap <silent> <leader>pp :silent exec "!playerctl -p spotify play-pause"<CR>
nnoremap <silent> <leader>pn :silent exec "!playerctl -p spotify next"<CR>
nnoremap <silent> <leader>pl :SpotifyPlaylist<CR>

" lsp
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap fmt <cmd>lua vim.lsp.buf.format()<cr>

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
  echo l:bufname
  if l:bufname == ''
    Telescope find_files
  endif
endfunction

if v:vim_did_enter
  call AutoTelescope()
else
  au VimEnter * call AutoTelescope()
endif

" close-buf
command! Q :Bdelete menu<CR>

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/battery.vim'
Plug 'embear/vim-localvimrc'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'wakatime/vim-wakatime'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'uarun/vim-protobuf'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'
Plug 'brooth/far.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'nicwest/vim-camelsnek'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim', { 'as': 'tokyonight' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'lunarvim/Onedarker.nvim'
Plug 'rafamadriz/neon'
Plug 'github/copilot.vim'
Plug 'Asheq/close-buffers.vim'
Plug 'SmiteshP/nvim-navic'
Plug 'simrat39/symbols-outline.nvim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'

Plug 'easymotion/vim-easymotion'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'f-person/git-blame.nvim'

" Status line
Plug 'nvim-lualine/lualine.nvim'

" -- Treesitter
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'windwp/nvim-autopairs'

" -- LSP and completion
" -- LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" -- Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'petertriho/cmp-git'

Plug 'nvim-telescope/telescope-ui-select.nvim'

" -- Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" -- Linter
Plug 'nvimtools/none-ls.nvim'
Plug 'nvimtools/none-ls-extras.nvim'
"Plug 'mfussenegger/nvim-lint'

" -- Formatter
Plug 'mhartington/formatter.nvim'

" -- Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" -- Zen mode
Plug 'folke/zen-mode.nvim'
Plug 'shortcuts/no-neck-pain.nvim', { 'tag': '*' }

" -- Yuck - eww highlight
Plug 'elkowar/yuck.vim'

" -- Pretty input box
Plug 'liangxianzhe/floating-input.nvim'

Plug '~/Documents/spotify.nvim'
Plug 'petobens/poet-v'

" -- mongo
Plug 'kopecmaciej/vi-mongo.nvim'
call plug#end()

colorscheme tokyonight

lua << EOF
  require("init");
EOF

" There is a reason why this is at the end of the file
hi Conceal guifg=#949494
