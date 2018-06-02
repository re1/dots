syntax on   "enable syntax highlighting

set autoread        "reload files change outside vim
set encoding=utf-8  "allow all UTF-8 characters
set exrc            "enable per directory vim files
set history=500     "save the last 500 changes
set lazyredraw      "do not redraw while executing macros
set nocompatible    "disable vi emulation
set secure          "disable unsafe commands
set ttyfast         "optimize for fast terminal connections

""" Completion
set completeopt=longest,menuone,preview "complete to shared characters and show menu
set complete+=kspell                    "complete with dictionary words when spell check is on
set matchpairs+=<:>                     "match XML
set wildmode=longest,list,full          "complete to shared characters and show list
set wildmenu                            "autocomplete files on tab

""" Formatting
set autoindent      "indent after indented line
set expandtab       "convert tabs to spaces (sorry guys)
set linebreak       "wrap lines a convenient points
set nojoinspaces    "single space after punctuation
set shiftround      "round indent to multiple of shift width
set shiftwidth=4    "number of spaces per indentation
set smartindent     "indent after indentation keywords (like brackets)
set softtabstop=4   "number of spaces a tab during editing operations (inserts)
set tabstop=4       "number of spaces a tab counts for
set wrap            "wrap lines too long to be displayed

""" Searching
set gdefault    "add g flag to search/replace by default
set hlsearch    "highlight matching search patterns
set incsearch   "enable incremental searching
set magic       "use magic regex
set smartcase   "smart casing for searching

""" Help
set number          "show line numbers
set ruler           "highlight current line
set laststatus=2    "always show the status line
set showcmd         "show command while typing
set showmode        "show current mode
set title           "show filename in window title bar

""" Usability
set scrolloff=2         "show two lines before window border
set whichwrap+=<,>,[,]  "allow horizontal movement between lines

""" Utility
"syntax highlighting colors
colorscheme base16-one-dark
"set airline StatusLine colors
let g:airline_theme='onedark'
"activate airline powerline plug-in
let g:airline_powerline_fonts = 1
"change completion menu colors
highlight Pmenu ctermfg=7 ctermbg=0
highlight PmenuSel ctermfg=0 ctermbg=4
"change line number colors
highlight LineNr ctermfg=8 ctermbg=0
"highlight lines with more than 100 characters
highlight OverLength ctermbg=red ctermfg=white
match OverLength /\%101v.\+/

""" Keybindings
"allow jumping between wrapped lines
im <silent> <Down> <C-o>gj
im <silent> <Up> <C-o>gk
nm <silent> <Down> gj
nm <silent> <Up> gk

"move lines by pressing CTRL
nn  <S-Down>       :m .+1  <CR>==
nn  <S-Up>         :m .-2  <CR>==
ino <S-Down><Esc>  :m .+1  <CR>==gi
ino <S-Up><Esc>    :m .-2  <CR>==gi
vn  <S-Down>       :m '>+1 <CR>gv=gv
vn  <S-Up>         :m '<-2 <CR>gv=gv

"toggle spellchecking
nn  <F7> :setlocal spell! spelllang=en_gb spell?<CR>
