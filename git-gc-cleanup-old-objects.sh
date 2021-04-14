#!/usr/bin/env bash
#
# see why we dont use git gc --aggressive
# https://stackoverflow.com/questions/28720151/git-gc-aggressive-vs-git-repack/
#

set -x

(find . -name .git -type d -not -path '*exclude*' | xargs -L1 find ) | wc -l

git gc -q
git repack -q -a -d --depth=250 --window=250
git prune

(find . -name .git -type d -not -path '*exclude*' | xargs -L1 find ) | wc -l
