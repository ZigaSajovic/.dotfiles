for f in sort(split(glob('~/.dotfiles/nvim/config/*.vim'), '\n'))
	exe 'source' f
endfor
