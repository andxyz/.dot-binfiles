#!/usr/bin/env bash

set -x
set -e

ctags_gem_home=`gem environment gemdir`
ctags_ruby_stdlib="$(rbenv prefix)/lib/ruby/$(basename "${ctags_gem_home}")"
ctags_gem_sources=`bundle list --paths`

if [[ $? -ne 0 ]]; then
  exit 1
fi

ctags -R --languages=ruby --exclude=.git --exclude=log . "${ctags_ruby_stdlib}" ${ctags_gem_sources}
