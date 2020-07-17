#!/bin/bash

sudo apt install curl git

if [ ! -e /usr/local ]; then
  mkdir -p /usr/local
fi

git clone https://github.com/sstephenson/bats.git
cd bats
./install.sh /usr/local
