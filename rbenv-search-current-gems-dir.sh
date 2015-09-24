#!/usr/bin/env bash
# use ack to search the current gem dir

ack -i "${@}" "$(gem environment gemdir)/gems"
