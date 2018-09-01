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
Plug 'mhartington/oceanic-next'

Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
call plug#end()

if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext
"This makes your backgrounds transparent, so make sure your terminal
"colorscheme is also OceanicNext
autocmd colorscheme * hi Normal guibg=NONE | hi EndOfBuffer guibg=NONE | hi LineNr guibg=NONE | hi TabLineFill NONE | hi ErrorMsg guibg=NONE | hi StatusLine gui=bold | hi StatusLine guibg=NONE | hi StatusLine guifg=#65737e | hi WildMenu guibg=NONE gui=bold guibg=#6699cc guifg=#1b2b34|hi Folded guibg=NONE guifg=#6699cc

"autocmd colorscheme * hi Normal guibg=NONE | hi EndOfBuffer guibg=NONE | hi LineNr guibg=NONE | hi TabLineFill NONE | hi ErrorMsg guibg=NONE | hi StatusLine gui=bold | hi StatusLine guibg=NONE | hi StatusLine guifg=#6699cc | hi WildMenu guibg=NONE gui=bold,reverse guibg=NONE guifg=N

set spell spelllang=en_gb
set nospell
filetype plugin indent on
syntax on
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set linebreak

set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"no statusline (like vim)
set laststatus=1

"turn of showing commands
set noshowcmd

"disable preview
set completeopt-=preview

"highlighting -> relevant when no colorscheme
"set background=dark
"highlight Visual cterm=reverse ctermbg=0
"highligh StatusLine cterm=NONE

let mapleader = ","

"wildmenu
let &wildcharm = &wildchar
cnoremap <C-j> <DOWN>
cnoremap <C-k> <UP>

"saving
nmap <leader>w :w!<cr>
nmap <C-s> :w<CR>
nmap <leader><C-s> :w<Space>
set ruler

"search
vnoremap * "fy/<C-R>f<CR>
nmap <silent> <leader>q :noh<cr>
vmap <silent> <leader>q :noh<cr>
set ignorecase
set smartcase
set hlsearch
set incsearch

set mat=1

set autoread

"change to the directory
autocmd BufEnter * silent! lcd %:p:h

"persistent undo
set undofile
set undodir=$HOME/.nvim/undo

set undolevels=1000
set undoreload=10000

"work with buffers
nnoremap <M-b> :buffers<CR>:buffer<Space> 
nnoremap <M-B> :w<CR>:buffers<CR>:buffer<Space>
nnoremap <leader><M-b> :buffers<CR>:vert sbuffer<Space> 
nnoremap <leader><M-B> :w<CR>:buffers<CR>:vert sbuffer<Space>

"set tabs
 set tabstop=2 | set shiftwidth=2 
      \ | set softtabstop=2 | set expandtab
"just in case some filetypes override this seting
autocmd FileType * set tabstop=2 | set shiftwidth=2 
      \ | set softtabstop=2 | set expandtab
set smarttab

set number 

"<F20> == <S-F8>
map <F20> :w !autopep8 --in-place --indent-size 2 --ignore E121 %<CR>

"tabs
nnoremap tn :tabnew<Space>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nmap tl :exe "tabn ".g:last_tab_<CR>
au TabLeave * let g:last_tab_= tabpagenr()

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
"comments
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType bash setlocal commentstring=#\ %s
autocmd FileType matlab setlocal commentstring=%\ %s
autocmd FileType octave setlocal commentstring=%\ %s

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
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"deoplete-jedi
let g:python_host_prog='/home/ziga/miniconda3/bin/python'
let g:python3_host_prog='/home/ziga/miniconda3/bin/python3'
"this enables large modules to load before timeout (tf,np)
let g:deoplete#sources#jedi#server_timeout=50
let g:LanguageClient_autoStart = 1

"neosnippet
let g:neosnippet#enable_completed_snippet=1
imap <C-o>     <Plug>(neosnippet_expand_or_jump)
smap <C-o>     <Plug>(neosnippet_expand_or_jump)
xmap <C-o>     <Plug>(neosnippet_expand_target)


" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
inoremap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
snoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

 
""mode switching <C-,> == <C-space>
"imap <C-,> <Esc>
"nmap <C-,> i

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
vnoremap L g_

set splitbelow
set splitright

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

"mouse
set mouse=a mousemodel=popup_setpos

