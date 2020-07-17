#!/bin/bash

set -eu

platform=macos

while getopts p: OPT
do
  case $OPT in
    p) platform=$OPTARG;;
    *) ;;
  esac
done

shift $((OPTIND -1))

if [ "${platform}" = macos ]; then
  bats --tap tests/macos/*.bats
elif [ "${platform}" = centos ]; then
  bats --tap tests/centos/*.bats
elif [ "${platform}" = ubuntu ]; then
  bats --tap tests/ubuntu/*.bats
fi

bats --tap tests/common/*.bats
