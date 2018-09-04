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

"wildmenu
let &wildcharm = &wildchar

set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch

"refresh rate in ms
set mat=1

"reload file on change
set autoread

"persistent undo
set undofile
set undodir=$HOME/.nvim/undo
set undolevels=1000
set undoreload=10000

"set tabs
 set tabstop=2 | set shiftwidth=2 
      \ | set softtabstop=2 | set expandtab
"just in case some filetypes override this setting
autocmd FileType * set tabstop=2 | set shiftwidth=2 
      \ | set softtabstop=2 | set expandtab
set smarttab

"line numbering
set number 

"split directions
set splitbelow
set splitright

"mouse
set mouse=a mousemodel=popup_setpos

"comments
autocmd FileType python setlocal commentstring=#\ %s
autocmd FileType bash setlocal commentstring=#\ %s
autocmd FileType matlab setlocal commentstring=%\ %s
autocmd FileType octave setlocal commentstring=%\ %s

"set cursor at line number of last location at previous viewing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"python binaries
let g:python_host_prog='/home/ziga/miniconda3/bin/python'
let g:python3_host_prog='/home/ziga/miniconda3/bin/python3'

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
set <C-RIGHT>=[1;5

