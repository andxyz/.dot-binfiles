#!/usr/bin/env bash

## some credit to http://stackoverflow.com/a/2514279

for branch in $(git branch $@ | ggrep -E -v 'HEAD' | gsed -r 's/\*//g'); do
  echo -e $(git show --format="%ci \t %cr \t by %cn" $branch | head -n 1) \\t $branch;
done |
sort -r |
column -t -s $'\t'
