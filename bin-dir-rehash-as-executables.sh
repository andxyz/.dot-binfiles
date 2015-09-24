#!/usr/bin/env bash
# make my ~/bin dir files executable again

find "${HOME}/bin" -type f -exec chmod o+x '{}' \;
rehash
