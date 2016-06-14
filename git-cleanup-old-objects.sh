#!/usr/bin/env bash
set -x

(find . -name .git -type d -not -path '*exclude*' | xargs -L1 find ) | wc -l

git gc -q
git repack -q -a -d --depth=250 --window=250
git prune

(find . -name .git -type d -not -path '*exclude*' | xargs -L1 find ) | wc -l
