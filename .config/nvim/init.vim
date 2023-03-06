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

set updatetime=300

set cursorline
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

let g:localvimrc_ask=0

" 234rpx

function! Rpx2Vh()
  let l:word = expand('<cword>>')
  let l:wordLen = strlen(l:word)
  let l:num = str2nr(strpart(l:word, 0, l:wordLen - 3))
  echo l:num
  let l:vh = l:num / 750.0 * 100 / 9 * 16
  echo l:vh
  execute "norm! ciw" . string(floor(l:vh)) . "vh"
endfunction

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

nnoremap <SPACE> <Nop>
let g:mapleader = ' '

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
nnoremap <silent> <C-F11> :FloatermNew<CR>
nnoremap <silent> <C-F10> :FloatermNext<CR>
nnoremap <silent> <C-F9> :FloatermPrev<CR>

" let g:airline_section_b = '%{strftime("%H:%M")}'
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#show_coc_status = 1
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode', ' | ', '%{strftime("%H:%M:%S")}'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" GoTo code navigation.
nmap <silent> gds :call CocActionAsync('jumpDefinition', 'vsplit')<CR>
nmap <silent> gdd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>c :CocCommand<CR>

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" show symbol
nnoremap <silent> <leader>s :<C-u>CocList symbols<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <leader>rn <Plug>(coc-rename)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <space>e <Cmd>CocCommand explorer<CR>

" fzf
nmap <Leader>z [fzf-p]
xmap <Leader>z [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>

nnoremap <silent> <leader>fmt :<C-u>CocCommand prettier.formatFile<CR>

" dap
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F11> :lua require'dap'.terminate()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_into()<CR>

call plug#begin()

Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lambdalisue/battery.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'embear/vim-localvimrc'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'iamcco/coc-diagnostic'
Plug 'wakatime/vim-wakatime'
Plug 'Yggdroot/indentLine'
Plug 'uarun/vim-protobuf'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'
Plug 'brooth/far.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'nicwest/vim-camelsnek'
Plug 'mfussenegger/nvim-dap'
Plug 'rafcamlet/coc-nvim-lua'
Plug '~/Documents/vim_dap_helper'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'leafOfTree/vim-svelte-plugin'

call plug#end()

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
let g:vimspector_enable_mappings = 'HUMAN'

" todo-comments config

" ========dap configurations
" dap-golang
lua << EOF
  local dap = require('dap')
  dap.adapters.go = {
    type = 'executable';
    command = 'node';
    args = {vim.fn.expand('~/dap/vscode-go/dist/debugAdapter.js')};
  }
  dap.configurations.go = {
    {
      type = 'go';
      name = 'Debug';
      request = 'launch';
      showLog = true;
      dlvToolPath = vim.fn.exepath('dlv');
      program = '${file}'
    },
  }
EOF

lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

colorscheme dracula

