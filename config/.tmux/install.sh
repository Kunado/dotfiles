#!/usr/bin/env bash

ls -1 dist | while read line
do
  filename=$(echo "${line}" | awk '{print $NF}')
  binfile=$(echo "${line}" | awk -F'[.]' '{print $1}')
  cp dist/${filename} bin/${binfile}
done

find bin ! -perm -a+x | while read line
do
  chmod 755 "${line}"
done
