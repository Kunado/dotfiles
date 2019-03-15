#!/bin/bash

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  ln -snfv $(pwd)/dotfiles/"$f" ~/
done
