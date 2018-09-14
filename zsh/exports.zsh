export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
export PATH="$PATH:$HOME/bin"
VISUAL=nvim; export VISUAL
EDITOR=nvim; export EDITOR
SUDO_EDITOR=nvim; export SUDO_EDITOR
