# Setup fzf
# ---------
if [[ ! "$PATH" == *~/.fzf/bin* ]]; then
  export PATH=$PATH:~/.fzf/bin
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source ~/.dotfiles/fzf/completion.zsh 2> /dev/null

# Key bindings
# ------------
source ~/.dotfiles/fzf/key-bindings.zsh

# Color sheme
source ~/.dotfiles/fzf/oceanic_next.config
