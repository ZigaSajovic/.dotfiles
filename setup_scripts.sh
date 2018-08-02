#!/bin/bash
toAppend='export PATH="$HOME/.dotfiles/scripts:$PATH"'
if [ -z "$(cat ~/.zshrc |grep $toAppend)" ]; then
  echo $toAppend >> ~/.zshrc
  . ~/.zshrc
fi
cd scripts
sudo chmod u=rwx *
