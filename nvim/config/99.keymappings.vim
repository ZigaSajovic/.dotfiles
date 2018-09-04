"define leader
let mapleader = ","

"wildmenu descend etc
cnoremap <C-j> <DOWN>
cnoremap <C-k> <UP>

"saving
nmap <leader>w :w!<cr>
nmap <C-s> :w<CR>
nmap <leader><C-s> :w<Space>

"search
vnoremap * "fy/<C-R>f<CR>
nmap <silent> <leader>q :noh<cr>
vmap <silent> <leader>q :noh<cr>

"<F20> == <S-F8>
map <F20> :w !autopep8 --in-place --indent-size 2 --ignore E121 %<CR>

"switching windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
"resizing windows
noremap <C-M-J> :resize -5<CR>
noremap <C-M-K> :resize +5<CR>
noremap <C-M-H> :vertical resize -5<CR>
noremap <C-M-L> :vertical  resize +5<CR>

"copy/ paste
noremap Y y$

"sort seection
vnoremap <Leader>s :sort<cr>

"indenting
vnoremap < <gv
vnoremap > >gv

"moving on wrap
inoremap <UP> <ESC>gka
inoremap <DOWN> <ESC>gja
vnoremap <UP> gk
vnoremap <DOWN> gj
nnoremap <UP> gk
nnoremap <DOWN> gj
"
nnoremap j gj
vnoremap k gk
vnoremap j gj
nnoremap k gk

"moving to end/start of nonwhitechar of line
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g
