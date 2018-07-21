call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux'
Plug 'terryma/vim-multiple-cursors'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
call plug#end()

filetype plugin indent on
syntax on

set spell spelllang=en_gb
set nospell
filetype indent on
syntax on
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"no statusline (like vim)
set laststatus=1

"turn of showing commands
set noshowcmd

"highlighting
set background=dark
highlight Visual cterm=reverse ctermbg=0
highligh StatusLine cterm=NONE

let mapleader = ","
"saving
nmap <leader>w :w!<cr>
command W w !sudo tee % > /dev/null

set ruler
"search
vnoremap * "fy/<C-R>f<CR>
map <silent> <leader><cr> :noh<cr>
set ignorecase
set smartcase
set hlsearch
set incsearch

set mat=1

set autoread

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set number relativenumber

map <S-F8> :w !autopep8 --in-place --indent-size 2 --ignore E121 %
"tabs
nnoremap <Leader>tn :tabnew<Space>
nnoremap <Leader>tk :tabnext<CR>
nnoremap <Leader>tj :tabprev<CR>
nmap <Leader>tl :exe "tabn ".g:last_tab_<CR>
au TabLeave * let g:last_tab_= tabpagenr()
"windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"copy/ paste
noremap Y y$
"comments
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType bash setlocal commentstring=#\ %s
autocmd FileType matlab setlocal commentstring=%\ %s
autocmd FileType octave setlocal commentstring=%\ %s

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

map <Leader>vp :VimuxPromptCommand<CR>
vmap <Leader>vs "vy :call VimuxSlime()<CR>
nmap <Leader>vs vip<Leader>vs<CR>

vnoremap <Leader>s :sort<cr>

"indenting
vnoremap < <gv
vnoremap > >gv

"NERDTree directories color
hi Directory guifg=#FF0000 ctermfg=blue
hi NERDTreeOpenable ctermbg=None ctermfg=207 guifg=#ff5fff 
hi NERDTreeClosable ctermbg=None ctermfg=207 guifg=#ff5fff
nmap <Leader>f :NERDTreeToggle<CR>

"deoplete
let g:deoplete#enable_at_startup = 1
"deoplete-jedi
let g:python_host_prog='/home/ziga/miniconda3/bin/python'
let g:python3_host_prog='/home/ziga/miniconda3/bin/python3'
"this enables large modules to load before timeout (tf,np)
let g:deoplete#sources#jedi#server_timeout=20

"mode switching <Nul> == <C-space>
imap <Nul> <Esc>
"nmap <Nul> i

"moving on wrap
inoremap <UP> <ESC>gki
inoremap <DOWN> <ESC>gji
vnoremap <UP> gk
vnoremap <DOWN> gj
nnoremap <UP> gk
nnoremap <DOWN> gj

"sets correct escape keys
set <S-UP>=[1;2A
set <S-DOWN>=[1;2B
set <S-LEFT>=[1;2D
set <S-RIGHT>=[1;2C
"sets escape keys for control
"note that vim does not know <c-up/down>
"so we map it explicitly
map [1;5A <Nop>
map [1;5B <Nop>
set <C-LEFT>=[1;5D
set <C-RIGHT>=[1;5C
