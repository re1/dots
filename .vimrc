""" Plug
call plug#begin('~/.vim/plugged')       "set plugin path

Plug 'arcticicestudio/nord-vim'         "nord colorscheme
Plug 'prettier/vim-prettier'            "vim wrapper for prettier
Plug 'trotter/autojump.vim'             "autojump support for vim
Plug 'vim-airline/vim-airline'          "lightweight powerline
Plug 'vim-airline/vim-airline-themes'   "themes for airline including onedark

if has('nvim')                          "check for nvim
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'              "for deoplate.nvim
    Plug 'roxma/vim-hug-neovim-rpc'     "for deoplate.nvim
endif

call plug#end()                         "init plugin system


""" Plugins
let g:deoplete#enable_at_startup = 1
"set airline StatusLine colors
let g:airline_theme='nord'
"adjust powerline icons to work with urxvt
let g:airline_symbols = {}
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'p'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'x'
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.maxlinenr = ''


""" Neovim
if has('nvim')

""" vim
else
    syntax on
    
    set nocompatible                "disable vi emulation
    set ttyfast                     "optimize for fast terminal connections
    
    set autoindent                  "indent after indented line
    set autoread                    "reload files change outside vim
    set backspace=eol,start,indent  "more backspace functionality
    set encoding=utf-8              "allow UTF-8 characters
    set hlsearch                    "highlight matching search patterns
    set incsearch                   "enable incremental searching
    set laststatus=2                "always show the status line
    set ruler                       "highlight current line
    set showcmd                     "show command while typing
    set wildmenu                    "autocomplete files on tab
    "persistant undo
    try
        set undodir=~/.vim/tmp/undo
        set undofile
    catch
    endtry
endif


""" General
filetype plugin indent on   "allow plugins to handle indentation

set exrc                    "enable per directory vim files
set ffs=unix,dos,mac        "use unix as default file type
set hid                     "hide inactive buffers
set history=500             "save the last 500 changes
set lazyredraw              "do not redraw while executing macros (avoid lag)
set secure                  "disable unsafe commands
set noerrorbells            "no error sound
set novisualbell            "no visual notification for error sounds

""" Completion
set completeopt=longest,menuone,preview "complete to shared characters and show menu
set complete+=kspell                    "complete with dictionary words when spell check is on
set matchpairs+=<:>                     "match XML
set path+=**                            "look into subfolders when looking for files
set wildmode=longest,list,full          "complete to shared characters and show list
set wildignore=*.o,*~,*.pyc             "wildmenu ignores compiled files

""" Formatting
set expandtab       "convert tabs to spaces (sorry guys)
set linebreak       "wrap lines a convenient points
set nojoinspaces    "single space after punctuation
set shiftround      "round indent to multiple of shift width
set shiftwidth=4    "number of spaces per indentation
set si              "indent after indentation keywords (like brackets)
set softtabstop=4   "number of spaces a tab during editing operations (inserts)
set tabstop=4       "number of spaces a tab counts for
set wrap            "wrap lines too long to be displayed

""" Searching
set gdefault    "add g flag to search/replace by default
set ignorecase  "ignore casing for searching
set magic       "use magic regex
set smartcase   "smart casing for searching

""" Help
set number          "show line numbers
set showmatch       "show matching brackets
set mat=2           "seconds to blink when matching brackets
set showmode        "show current mode
set title           "show filename in window title bar

""" Usability
set so=6                        "show two lines before window border
set whichwrap+=<,>,h,l,[,]      "allow horizontal movement between lines


""" Utility
"syntax highlighting colors
colorscheme nord
"remove gui and terminal background for better terminal integration
hi Normal guibg=NONE ctermbg=NONE
"change completion menu colors
hi Pmenu ctermfg=7 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=4
"change search mathing colors
hi Search ctermfg=8 ctermbg=3
"change line number colors
hi LineNr ctermfg=8 ctermbg=NONE
"change tab line colors
hi TabLine ctermfg=8
hi TabLineSel ctermfg=8 ctermbg=3
"hi lines with more than 100 characters
hi OverLength ctermbg=red ctermfg=white
match OverLength /\%101v.\+/
" delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

""" Commands
"automatic commands
if has("autocmd")
    "clean extra spaces for some files
    autocmd BufWritePre *.md,*.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
    "omni-complete functions
    autocmd FileType css set omnifunc=csscomplete#CompleteCSS
endif

"save file using sudo
command W w !sudo tee > /dev/null %

""" Keybindings

"map Space to search and Ctrl-Space to backward search
map <space> /
map <c-space> ?

"remap 0 to first non-blank character
map 0 ^

"allow jumping between wrapped lines
"imap <silent> <Down> <C-o>gj
"imap <silent> <Up> <C-o>gk
"nmap <silent> <Down> gj
"nmap <silent> <Up> gk

"move lines by pressing alt
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

"toggle spellchecking
nnoremap <F7> :setlocal spell! spelllang=en_gb spell?<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

