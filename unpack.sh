#!/usr/bin/env bash

for file in "$*"; do
  case $file in
    *.tar)
      gtar -xvf "$file"
      ;;
    *.tar.gz|*.tgz)
      gtar -zxvf "$file"
      ;;
    *.tar.bz|*.tar.bz2|*.tbz|*.tbz2)
      gtar -jxvf "$file"
      ;;
    *.rar)
      unrar e "$file"
      ;;
    *.zip)
      unzip "$file"
      ;;
    *)
      echo "File $file is of unknown type"
  esac
done
