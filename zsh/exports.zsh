export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
export PATH="$PATH:$HOME/bin"
VISUAL=nvim; export VISUAL
EDITOR=nvim; export EDITOR
SUDO_EDITOR=nvim; export SUDO_EDITOR
export PATH="$HOME/.dotfiles/scripts:$PATH"
export PATH="/usr/local/matlab/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
