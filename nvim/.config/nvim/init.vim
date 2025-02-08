""" Plug
"automate Plug install for new homes
if empty(glob(stdpath('data') . '/site/autoload/plug.vim'))
    silent !curl -fLo stdpath('data') . '/site/autoload/plug.vim' --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'itchyny/lightline.vim'

call plug#end()


""" Plugins
"lightline with catppuccin theme
let g:lightline = {'colorscheme': 'catppuccin'}

""" Automation
"delete trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

""" Use space as leader
nnoremap <Space> <Nop>
let mapleader = ' '

""" General
set undofile	"enable persistent undo
set noshowmode	"not needed with lightline

""" Completion
set complete+=kspell	"complete with dictionary words when spell check is on
set matchpairs+=<:>	"match XML

""" Formatting
set softtabstop=2   "number of spaces that a <Tab> counts for
set shiftwidth=2    "number of spaces per indentation
set shiftround      "round indent to multiple of shift width
set smartindent     "indent after indentation keywords (like brackets)
set linebreak       "wrap lines a convenient points

""" Searching
set gdefault	    "add g flag to search/replace by default
set ignorecase	    "ignore casing for searching
set smartcase	    "smart casing for searching

""" Help
set relativenumber  "show line numbers relative to current position
set showmatch       "show matching brackets

""" Visibility
set scrolloff=6		  "show two lines before window border
set whichwrap+=<,>,[,]	  "allow horizontal movement between lines
set foldlevelstart=99	  "start without closed folds

""" Highlighting
colorscheme catppuccin
"remove gui and terminal background for better terminal integration
hi Normal guibg=NONE ctermbg=NONE
"change completion menu colors
hi Pmenu ctermfg=7 ctermbg=0
hi PmenuSel ctermfg=0 ctermbg=4
"change tab line colors
hi TabLine ctermfg=8
hi TabLineSel ctermfg=8 ctermbg=3
"hi lines with more than 100 characters
hi OverLength ctermbg=red ctermfg=white
match OverLength /\%101v.\+/

""" Commands

"save file using sudo
command W w !sudo tee > /dev/null %

""" Keybindings

"jump to first non-blank character on 0
map 0 ^

"copy to and cut to clipboard
vnoremap <c-c> "+y
vnoremap <c-x> "+d
"save file using control-s as in most other editors
map <c-s> :w<CR>

"move lines by pressing alt
nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

"toggle spellchecking
nnoremap <F7> :setlocal spell! spelllang=en_gb spell?<CR>
nnoremap <F8> :setlocal spell! spelllang=de_at spell?<CR>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<c-u>call VisualSelection('', '')<CR>/<c-R>=@/<CR><CR>
vnoremap <silent> # :<c-u>call VisualSelection('', '')<CR>?<c-R>=@/<CR><CR>

