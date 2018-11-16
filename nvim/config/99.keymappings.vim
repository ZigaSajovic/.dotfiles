"wildmenu descend etc
cnoremap <C-j> <DOWN>
cnoremap <C-k> <UP>

"saving
nmap <leader>w :w!<cr>
nmap <C-s> :w<CR>
nmap <leader><C-s> :w<Space>

"search
xnoremap * "fy/<C-R>f<CR>
nnoremap <leader>* :Sub<space>\<\><space>
nnoremap <leader>? :SubC<space>\<\><space>
nmap <silent> <leader>q :noh<cr>
xmap <silent> <leader>q :noh<cr>

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
"switching windows for terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"copy/ paste
nnoremap Y y$
nnoremap <Leader>y "+y
xnoremap <Leader>y "+y
nnoremap <Leader>p "+p
xnoremap <Leader>p "+p
nnoremap <Leader>P "+P
xnoremap <Leader>P "+P

"sort seection
xnoremap <Leader>s :sort<cr>

"indenting
xnoremap < <gv
xnoremap > >gv

"moving on wrap
inoremap <UP> <ESC>gka
inoremap <DOWN> <ESC>gja
noremap <UP> gk
noremap <DOWN> gj
noremap <UP> gk
noremap <DOWN> gj
onoremap <UP> gk
onoremap <DOWN> gj
"
nnoremap k gk
nnoremap j gj
xnoremap k gk
xnoremap j gj
onoremap k gk
onoremap j gj

"moving to end/start of nonwhitechar of line
nnoremap H ^
nnoremap L g_
xnoremap H ^
xnoremap L g_
onoremap H ^
onoremap L g_
