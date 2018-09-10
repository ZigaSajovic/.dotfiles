#!/bin/zsh

syn=./function_call.vim
dir_=~/.config/nvim/after/syntax
[[ ! -d $dir_ ]] && mkdir -p $dir_

append_if_must()
{
  fle_=$dir_/$1
  [[ ! -f $fle_ ]] && touch $fle_
  cat <(grep -v -x -f $syn_ $fle_) <(echo -e '"function call') $syn > $fle_
}

for f in $(sed '/^\s*$/d' ./lang_list);do
  append_if_must $f
done
