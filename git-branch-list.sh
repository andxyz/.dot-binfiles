#!/usr/bin/env bash

## some credit to http://stackoverflow.com/a/2514279
## list branches by last committed on
## it looks something like this
## 2016-11-24T17:57:09-05:00    17 hours ago    by Andrew Stevens    andxyz-filter-inventory-tweak

if [[ $(uname -s) == Darwin ]]; then
  PREFIX="g"
else # linux
  PREFIX=""
fi;

for branch in $(git branch ${@} --sort='-committerdate' | ${PREFIX}head -n200 | ${PREFIX}grep -E -v 'HEAD' | ${PREFIX}sed -r 's/\*//g'); do
  echo -e $(git show --format="%cI \t %cr \t by %cn" $branch | head -n 1) \\t $branch;
done |
column -t -s $'\t'

