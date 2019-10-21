#!/usr/bin/env bash
# Usage: git-branch-prune
# Delete all merged branches.

# prune local
# git branch --merged | grep -v "\*" | xargs -n 1 git branch --delete

# prune github
# git remote prune origin

# prune local branches
git branch --merged | grep -v "\*" | grep -v master | xargs -I{} -n 1 echo "git branch --delete {}";
git branch --merged | grep -v "\*" | grep -v production | xargs -I{} -n 1 echo "git branch --delete {}";
