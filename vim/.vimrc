set nocompatible

syntax on

" Vundle begins here; turn off filetype temporarily
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'benmills/vimux'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

call vundle#end()

filetype plugin indent on

set term=screen-256color
map <C-n> :NERDTreeToggle<CR>

set spell spelllang=en_gb
set nospell
filetype indent on
syntax on
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

set background=dark
highlight Visual cterm=reverse ctermbg=0

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

vnoremap < <gv
vnoremap > >gv

hi Directory guifg=#FF0000 ctermfg=blue

hi NERDTreeOpenable ctermbg=None ctermfg=207 guifg=#ff5fff 
hi NERDTreeClosable ctermbg=None ctermfg=207 guifg=#ff5fff
