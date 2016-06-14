#!/bin/bash

set -x
set -e

test -e '.rubocop.yml' &&
RUBOCOP_CONFIG_FILE_SETTING='--config .rubocop.yml'

rubocop --display-cop-names --lint ${RUBOCOP_CONFIG_FILE_SETTING} --force-exclusion $(git ls-files |
ggrep -Ei '(rb,.rake,.podspec,.jbuilder,Gemfile,Rakefile,Podfile,Thorfile,Fastfile,Vagrantfile)' |
ggrep -v _spec)
