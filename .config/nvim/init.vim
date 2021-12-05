lua require('plugin')

filetype plugin indent on
syntax on

set termguicolors
let g:tokyonight_style = "night"
colo tokyonight

set breakindent
set clipboard=unnamed
set completeopt=menuone,noselect
set copyindent
set cursorline
set diffopt&
      \ diffopt+=vertical
      \ diffopt+=hiddenoff
set expandtab
set hidden
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldnestmax=10
set foldlevelstart=99
set inccommand=nosplit
set ignorecase infercase smartcase
set list listchars=tab:⁚⁚,space:·,trail:·,extends:→,precedes:←
set mouse=a
set nobackup
set nohlsearch
set noruler
set noshowcmd noshowmode
set noswapfile
set number
set scrolloff=999
set shiftround
set shiftwidth=0
set shortmess+=c
set signcolumn=number
set smartindent
set splitbelow splitright
set tabstop=2
set textwidth=120
set timeoutlen=300 ttimeoutlen=100
set undofile
set undodir=$HOME/.cache/nvim/undo/
set updatetime=300
set whichwrap=b,h,l,s,<,>,[,],~
set wildcharm=<Tab>
set wildmenu

let mapleader="\<Space>"
let &softtabstop = &tabstop
let &listchars="tab:- ,trail:· ,extends:→,precedes:←"
let &showbreak="↪ "
let &fillchars='vert: ,fold:·'
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1
let g:coq_settings = { "auto_start": "shut-up" }

if executable('rg')
  set grepprg=rg\ --vimgrep
endif
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr fun#grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr fun#grep(<f-args>)

nnoremap ; :
xnoremap ; :
nnoremap : ;
inoremap kj <Esc>
cnoremap kj <Esc>

nnoremap j gj
nnoremap k gk
nnoremap n nzvzz
nnoremap N Nzvzz
nnoremap * *zvzzN
nnoremap # #zvzz
nnoremap 0 ^
nnoremap ^ 0

nnoremap <silent> <BS> <C-^>
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>

nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

" moving this logic to be handled alongside compe.nvim settings
" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-Tab>"

cnoremap <expr> <Tab>   getcmdtype() == "/" \|\| getcmdtype() == "?"
      \ ? "<CR>/<C-r>/" : "<C-z>"
cnoremap <expr> <S-Tab> getcmdtype() == "/" \|\| getcmdtype() == "?"
      \ ? "<CR>?<C-r>/" : "<S-Tab>"

nnoremap <Leader>/ :Grep<Space>
nnoremap <Leader>* :Grep <C-R>=expand("<cword>")<CR><CR>

nnoremap <Leader><space> :e<space>

function! SortOp(type, ...)
  '[,']sort
endfunction
nnoremap <silent> so :set opfunc=SortOp<CR>g@

function! SubstituteOp(type, ...)
  let cur = getpos("''")
  call cursor(cur[1], cur[2])
  let cword = expand('<cword>')
  execute "'[,']s/" . cword . "/" . input(cword . '/')
  call cursor(cur[1], cur[2])
endfunction
noremap <silent> su m':set opfunc=SubstituteOp<CR>g@

" function! StatusBranch()
"   let branch = fugitive#head()
"   return empty(branch) ? '' : '(' . branch . ')'
" endfunction
" set statusline=\ %<%f\ %{StatusBranch()}\ %h%m%r%=\ %y\

augroup general
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
  autocmd BufWritePre * call fun#trim()
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd VimResized * :wincmd =
  autocmd VimEnter * lua require 'utils/path'.Path()
augroup END

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost cgetexpr cwindow
  autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

