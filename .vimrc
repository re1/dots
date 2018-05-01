
syntax on

set autoindent
set encoding=utf-8  "allow all utf-8 characters
set expandtab
set hlsearch        "highlight matching search patterns
set incsearch       "enable incremental searching
set laststatus=2
set lazyredraw      "do not redraw while executing macros
set magic           "use magic regex
set matchpairs+=<:> "match xml
set nocompatible
set noshiftround
set number
set ruler           "show current position
set shiftwidth=4
set showmode
set smartcase       "smart casing for searching
set smartindent
set softtabstop=4
set statusline+=%F
set tabstop=4

highlight LineNr ctermfg=black

nnoremap <S-Down>       :m .+1  <CR>==
nnoremap <S-Up>         :m .-2  <CR>==
inoremap <S-Down><Esc>  :m .+1  <CR>==gi
inoremap <S-Up><Esc>    :m .-2  <CR>==gi
vnoremap <S-Down>       :m '>+1 <CR>gv=gv
vnoremap <S-Up>         :m '<-2 <CR>gv=gv
