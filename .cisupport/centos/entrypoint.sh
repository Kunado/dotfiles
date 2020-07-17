#!/bin/bash

set -eu

cat branch
branch=$(cat branch)

if [ -z "${branch}" ]; then
  branch=master
fi

echo $branch

echo 'Execute install.sh'
curl https://raw.githubusercontent.com/Kunado/dotfiles/$branch/install.sh > install.sh

chmod 755 install.sh
./install.sh -y -b $branch

echo 'Run tests for CentOS'
cd ~/dev/src/github.com/kunado/dotfiles
git checkout $branch
./test.sh -p centos
