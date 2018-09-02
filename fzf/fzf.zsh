# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ziga/.fzf/bin* ]]; then
  export PATH="$PATH:/home/ziga/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ziga/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ziga/.fzf/shell/key-bindings.zsh"

# Color sheme
source "/home/ziga/.dotfiles/fzf/oceanic_next.config"
