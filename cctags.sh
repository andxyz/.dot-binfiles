#!/usr/bin/env bash

set -x
set -e

CTAGS_GEM_HOME=`rbenv exec gem environment gemdir`
CTAGS_RBENV_PREFIX=`rbenv prefix`
CTAGS_RUBY_BASENAME=`basename "${CTAGS_GEM_HOME}"`
CTAGS_RUBY_STDLIB="${CTAGS_RBENV_PREFIX}/lib/ruby/${CTAGS_RUBY_BASENAME}"

if [[ $? -ne 0 ]]; then
  exit 1
fi

/usr/local/bin/ctags -R --languages=ruby --exclude=.git --exclude=log .  "${CTAGS_RUBY_STDLIB}" $(rbenv exec bundle list --paths)
