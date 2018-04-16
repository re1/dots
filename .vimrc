syntax on
set tabstop=4
set shiftwidth=4
set expandtab

nnoremap <S-Down>       :m .+1  <CR>==
nnoremap <S-Up>         :m .-2  <CR>==
inoremap <S-Down><Esc>  :m .+1  <CR>==gi
inoremap <S-Up><Esc>    :m .-2  <CR>==gi
vnoremap <S-Down>       :m '>+1 <CR>gv=gv
vnoremap <S-Up>         :m '<-2 <CR>gv=gv
