#!/usr/bin/env bash
# use find to look for different gem folders

find "$(gem environment gemdir)/gems" -iname "*${@}*"
