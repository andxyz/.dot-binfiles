#!/bin/sh
# Usage: git-thanks.sh <since>..<until>
#
# All commits on master, ever:
#   git-thanks.sh master
#
# All commits on master since the 0.9.0 tag:
#   git-thanks.sh 0.9.0..master

git log "$1" |
  ggrep 'Author:' |
  gsed 's/Author: \(.*\) <.*/\1/' |
  gsort |
  guniq -c |
  gsort -rn |
  gsed 's/ *\([0-9]\{1,\}\) \(.*\)/\2 (\1)/'
