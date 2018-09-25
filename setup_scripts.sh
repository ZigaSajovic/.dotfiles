#!/bin/zsh

toAppend='export PATH="$HOME/.dotfiles/scripts:$PATH"'
[[  -z $(grep $toAppend ~/.dotfiles/zsh/exports.zsh)  ]] && echo $toAppend >> ~/.dotfiles/zsh/exports.zsh && . ~/.dotfiles/zsh/exports.zsh
cd scripts
sudo chmod u=rwx $(ls -p | grep -v /) 
