#!/bin/sh

function version_check() {
  command=$1
  if [ $# -gt 1 ]; then
    option=$2
  else
    option='-v'
  fi
  $($command $option)
}

version_check git --version
