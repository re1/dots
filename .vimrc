syntax on

set autoindent
set autoread            "reload files change outside vim
set complete+=kspell    "complete with dictionary words when spell check is on
set encoding=utf-8      "allow all utf-8 characters
set expandtab
set exrc                "enable per directory vim files
set gdefault            "add g flag to search/replace by default
set history=500
set hlsearch            "highlight matching search patterns
set incsearch           "enable incremental searching
set laststatus=2
set lazyredraw          "do not redraw while executing macros
set linebreak           "wrap lines a convenient points
set magic               "use magic regex
set matchpairs+=<:>     "match xml
set nocompatible        "disable vi emulation
set nojoinspaces        "single space after punctuation
set noshiftround
set number
set ruler               "highlight current line
set scrolloff=2         "show two lines before window border
set secure              "disable unsafe commands
set shiftwidth=4
set showcmd             "show command while typing
set showmode
set smartcase           "smart casing for searching
set smartindent
set softtabstop=4
set statusline+=%F
set tabstop=4
set title               "show filename in window titlebar
set ttyfast             "optimize for fast terminal connections
set wrap                "wrap lines
set whichwrap+=<,>,[,]  "make arrows usable

"change color of line numbers
highlight LineNr ctermfg=black
"highlight lines with more than 100 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

"allow jumping between wrapped lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"move lines by pressing CTRL
nnoremap <S-Down>       :m .+1  <CR>==
nnoremap <S-Up>         :m .-2  <CR>==
inoremap <S-Down><Esc>  :m .+1  <CR>==gi
inoremap <S-Up><Esc>    :m .-2  <CR>==gi
vnoremap <S-Down>       :m '>+1 <CR>gv=gv
vnoremap <S-Up>         :m '<-2 <CR>gv=gv

