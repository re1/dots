syntax on               "enable syntax highlighting

set autoread            "reload files change outside vim
set encoding=utf-8      "allow all UTF-8 characters
set exrc                "enable per directory vim files
set ffs=unix,dos,mac    "use unix as default file type
set hid                 "hide inactive buffers
set history=500         "save the last 500 changes
set lazyredraw          "do not redraw while executing macros (avoid lag)
set nocompatible        "disable vi emulation
set secure              "disable unsafe commands
set ttyfast             "optimize for fast terminal connections
set noerrorbells        "no error sound
set novisualbell        "no visual notification for error sounds

""" Completion
set completeopt=longest,menuone,preview "complete to shared characters and show menu
set complete+=kspell                    "complete with dictionary words when spell check is on
set matchpairs+=<:>                     "match XML
set wildmode=longest,list,full          "complete to shared characters and show list
set wildmenu                            "autocomplete files on tab
set wildignore=*.o,*~,*.pyc             "wildmenu ignores compiled files

""" Formatting
set ai              "indent after indented line
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
set hlsearch    "hi matching search patterns
set ignorecase  "ignore casing for searching
set incsearch   "enable incremental searching
set magic       "use magic regex
set smartcase   "smart casing for searching

""" Help
set number          "show line numbers
set ruler           "hi current line
set laststatus=2    "always show the status line
set showcmd         "show command while typing
set showmatch       "show matching brackets
set mat=2           "seconds to blink when matching brackets
set showmode        "show current mode
set title           "show filename in window title bar

""" Usability
set backspace=eol,start,indent  "more backspace functionality
set so=6                        "show two lines before window border
set whichwrap+=<,>,h,l,[,]      "allow horizontal movement between lines

""" Filetypes
filetype plugin indent on   "allow filetypes to set indentation

""" Utility
"syntax highlighting colors
colorscheme base16-one-dark
"set airline StatusLine colors
let g:airline_theme='onedark'
"adjust powerline icons to work with urxvt
let g:airline_symbols = {}
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = '∥'
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
"remove gui and terminal background for better terminal integration
hi Normal guibg=NONE ctermbg=NONE
"change completion menu colors
hi Pmenu ctermfg=7 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=4
"change line number colors
hi LineNr ctermfg=8 ctermbg=NONE
"hi lines with more than 100 characters
hi OverLength ctermbg=red ctermfg=white
match OverLength /\%101v.\+/
"create parent directories for saved files if they do not exist
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
    autocmd!
augroup END
" delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

"persistant undo
try
    set undodir=~/.vim/tmp/undo
    set undofile
catch
endtry

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
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"move lines by pressing Shift
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

"toggle spellchecking
nnoremap <F7> :setlocal spell! spelllang=en_gb spell?<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
