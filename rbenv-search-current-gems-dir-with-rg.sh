#!/usr/bin/env bash
# use rg to search the current gem dir

rg -i "${@}" "$(gem environment gemdir)/gems"
