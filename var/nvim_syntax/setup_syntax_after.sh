#!/bin/zsh

syn_='function_call.vim'
dir_=~/.config/nvim/after/syntax
[[ ! -d $dir_ ]] && mkdir -p $dir_

append_if_must()
{
  fle_=$dir_/$1
  [[ ! -f $fle_ ]] && touch $fle_
  tmp=$(cat <(awk '{if (f==1) { r[$0] } else if (! ($0 in r)) { print $0 } } ' f=1 $syn_ f=2 $fle_) $syn_)
  echo -e "$tmp" > $fle_
}
for f in $(sed '/^\s*$/d' ./lang_list);do
  append_if_must $f
done
