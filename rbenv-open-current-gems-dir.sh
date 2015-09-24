#!/usr/bin/env bash
# opens your ruby gemdir in your editor

$EDITOR "$(gem environment gemdir)/gems"
