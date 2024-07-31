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
let g:camelsnek_no_fun_allowed = 0 " Shorter alias for the above.
let g:airline_theme = 'catppuccin'
let g:airline_highlighting_cache = 1
let g:coc_start_at_startup = v:false

nmap <C-j> 4j
nmap <C-k> 4k

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
nnoremap <silent> <F11> :FloatermNew<CR>
nnoremap <silent> <F10> :FloatermNext<CR>
nnoremap <silent> <F9> :FloatermPrev<CR>

if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif
" let g:airline_section_b = '%{strftime("%H:%M")}'
" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#coc#show_coc_status = 1
function! AirlineInit()
  " let g:airline_section_a = airline#section#create(['mode', ' | ', '%{strftime("%H:%M:%S")}'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

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

nnoremap <silent> <leader>fmt :<C-u>CocCommand editor.action.formatDocument<CR>

" telescope
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>S <cmd>Telescope treesitter<cr>
nnoremap gr <cmd>Telescope lsp_references<cr>
nnoremap gd <cmd>Telescope lsp_definitions<cr>
nnoremap <leader>s <cmd>Telescope lsp_document_symbols<cr>

" lsp
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <leader>a <cmd>lua vim.lsp.buf.code_action()<cr>
nnoremap <leader>fmt <cmd>lua vim.lsp.buf.format()<cr>

" zen mode
nnoremap <leader>Z <cmd>ZenMode<CR>

" close-buf
command! Q :Bdelete menu<CR>

nnoremap <silent> <leader>e :Neotree toggle<CR>

if v:vim_did_enter
  Telescope find_files
else
  au VimEnter * Telescope find_files
endif

call plug#begin()

Plug 'tpope/vim-surround'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" Plug 'iamcco/coc-diagnostic'
Plug 'wakatime/vim-wakatime'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'uarun/vim-protobuf'
Plug 'terryma/vim-multiple-cursors'
Plug 'bkad/CamelCaseMotion'
Plug 'brooth/far.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'nicwest/vim-camelsnek'
" Plug 'rafcamlet/coc-nvim-lua'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'folke/tokyonight.nvim', { 'as': 'tokyonight' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'lunarvim/Onedarker.nvim'
Plug 'rafamadriz/neon'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'github/copilot.vim'
" Plug 'lilydjwg/fcitx.vim'
Plug 'udalov/kotlin-vim'
Plug 'Asheq/close-buffers.vim'
Plug 'SmiteshP/nvim-navic'
Plug 'simrat39/symbols-outline.nvim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'f-person/git-blame.nvim'

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
call plug#end()

colorscheme tokyonight
hi Conceal guifg=#949494

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
let g:vimspector_enable_mappings = 'HUMAN'

" todo-comments config
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
hi todobgfix guibg=#bf616a guifg=#d8dee9 gui=bold
hi todobgtodo guibg=#d08770 guifg=#3b4252 gui=bold
hi todobghack guibg=#a3be8c guifg=#3b4252 gui=bold
hi todobgwarn guibg=#ebcb8b guifg=#2e3440 gui=bold

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
  require("ibl").setup()
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true
    },
  }
EOF

lua << EOF
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
EOF

lua << EOF
  require("mason").setup()
  require("mason-lspconfig").setup()

  vim.lsp.set_log_level("debug")
  local null_ls = require("null-ls")
  null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettier,
        require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    },
  })

  local cmp = require'cmp'

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    preselect = cmp.PreselectMode.Item,
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'null-ls' },
      { name = 'vsnip' }, -- For vsnip users.
    }, {
      { name = 'buffer' },
    }),
  }
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
  })
  require("cmp_git").setup()

  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require("mason-lspconfig").setup_handlers {
    function (server_name)
      require("lspconfig")[server_name].setup {
        capabilities = capabilities,
        init_options = {
          preferences = {
            ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets"] = true,
            ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingEmptyBraces"] = true,
            ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces"] = true,
            ["typescript.format.insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces"] = true,
          }
        }
      }
    end,
    
    ["null-ls"] = require("null-ls").setup({
      capabilities = capabilities,
      on_attach = function(client)
          if client.resolved_capabilities.document_formatting then
              vim.cmd([[
                  augroup LspFormatting
                      autocmd! * <buffer>
                      autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                  augroup END
              ]])
          end
      end,
    })

  }

  require("formatter").setup {
    filetype = {
      typescript = {
        function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
      }
    }
  }
  
  require("neo-tree").setup {
    open_on_setup = true,
    window = {
      mappings = {
        ["s"] = "open_split",
        ["E"] = "open_vsplit",
        ["l"] = "open",
        ["h"] = "close_node",
      }
    }
  }
EOF

lua << EOF
  require("zen-mode").setup {
    window = {
      width = 150,
      height = 0.95,
    }
  }
EOF

" pairs
lua << EOF
require("nvim-autopairs").setup {}
EOF

sign define DiagnosticSignError text= texthl=DiagnosticSignError
sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn
sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo
sign define DiagnosticSignHint text=󰌵 texthl=DiagnosticSignHint
