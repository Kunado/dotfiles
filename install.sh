#!/bin/bash

set -eu

while getopts y OPT
do
    case $OPT in
      y) FLAG_Y=1;;
    esac
done

shift $((OPTIND -1))

is_setup() {
  if [ $FLAG_Y -eq 1 ]; then
    return 0
  fi
  echo "Do you setup $1? [y/N]"
  while :
  do
    read -r answer
    case $answer in
      'yes' | 'y') return 0;;
      [nN]o | [nN]) return 1 ;;
      #*) echo "Try again because you input incorrect letter. Do you setup $1? [y/N]" ;;
    esac
  done
}

if [ "$(uname)" = 'Darwin' ]; then
  if is_setup 'Xcode Command Line Tools'; then
    if [ -e $(xcode-select --print-path) ]; then
      echo 'Xcode Command Line Tools has already been installed'
    else
      xcode-select --install
    fi
  fi

  if is_setup 'Homebrew'; then
    brew -v
    ret=$?
    if [ $ret -ne 0 ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
  fi
fi

curl https://raw.githubusercontent.com/Kunado/dotfiles/master/config/.gitconfig > $HOME/.gitconfig

bin/setup_mitamae.sh

# Homebrew does not allow sudo.
case "$(uname)" in
  "Darwin")  bin/mitamae local $@ lib/recipe.rb ;;
  *) sudo -E bin/mitamae local $@ lib/recipe.rb ;;
esac
