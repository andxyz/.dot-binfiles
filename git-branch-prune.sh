#!/usr/bin/env bash
# Usage: git-branch-prune
# Delete all merged branches.

# prune local
# git branch --merged | grep -v "\*" | xargs -n 1 git branch --delete

# prune github
# git remote prune origin

# prune local branches
git branch --merged | grep --invert-match "\*" | egrep --invert-match --extended-regexp "main|master|production" | xargs -I{} echo "git branch --delete {}";
