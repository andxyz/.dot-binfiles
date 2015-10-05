#!/usr/bin/env bash

gfind /usr/local/Cellar/git/2.5.3/libexec/git-core/ -type f -print0 |
gxargs -0 file |
ggrep -i 'script' |
gcut -d: -f1 |
gxargs ghead -n1 2>&1 > "${HOME}/Desktop/shell-output.txt"
