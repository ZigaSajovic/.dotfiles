call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux'
Plug 'mhartington/oceanic-next'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'w0rp/ale'
Plug 'mg979/vim-visual-multi'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'maverickg/stan.vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'junegunn/gv.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
call plug#end()
