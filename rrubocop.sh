#!/bin/bash

set -x
set -e

test -e '.rubocop.yml' && RUBOCOP_CONFIG_FILE_SETTING='--config .rubocop.yml'
RUBOCOP_GOOD_FILES="rb,.rake,.podspec,.jbuilder,Gemfile,Rakefile,Podfile,Thorfile,Fastfile,Vagrantfile"

rubocop --display-cop-names ${RUBOCOP_CONFIG_FILE_SETTING} --force-exclusion \
$(git ls-files | ggrep -Ei "(${RUBOCOP_GOOD_FILES})" | ggrep -v _spec)
