#!/bin/bash

toAppend='export PATH="$HOME/.dotfiles/scripts:$PATH"'
if [ -z '$(grep -q  "$toAppend" ~/.zshrc)' ]; then
  echo $toAppend >> ~/.zshrc
  . ~/.zshrc
fi
cd scripts
sudo chmod u=rwx "$(ls -p | grep -v /)" 
