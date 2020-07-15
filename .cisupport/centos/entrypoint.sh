#!/bin/bash

echo 'Install curl and bats with script'
curl https://raw.githubusercontent.com/Kunado/dotfiles/master/.cisupport/centos/install_curl_and_bats.sh > install_curl_and_bats.sh
chmod 755 install_curl_and_bats.sh
./install_curl_and_bats.sh

echo 'Execute install.sh'
curl https://raw.githubusercontent.com/Kunado/dotfiles/master/install.sh > install.sh
chmod 755 install.sh
./install.sh -y

echo 'Run tests for CentOS'
cd ~/dev/src/github.com/kunado/dotfiles
bats --tap tests/centos/*.bats
bats --tap tests/common/*.bats
