#!/usr/bin/env bash

set -e
set -x

find . -name .git -type d -prune | \
  xargs -n1 -P4 -I '{}' \
    git --git-dir='{}' config --get 'remote.origin.url'
