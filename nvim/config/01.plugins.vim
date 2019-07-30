call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-fugitive'
Plug 'benmills/vimux'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'mhartington/oceanic-next'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'vimwiki/vimwiki'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'w0rp/ale'
Plug 'mg979/vim-visual-multi'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
"Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
call plug#end()
