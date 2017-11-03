#!/usr/bin/env bash

set -x

# man ctags
# ctags --list-languages
# ctags-exuberant http://docs.ctags.io/en/latest/news.html#new-options

GIT_DIRECTORY="$(/usr/local/bin/git rev-parse --git-dir)"
trap 'rm -f "$GIT_DIRECTORY/$$.tags"' EXIT

/usr/local/bin/ctags --sort=yes -R --tag-relative \
--languages=+javascript,+sql \
--exclude=.git \
--exclude=data \
--exclude=log \
--exclude=\*.min.js \
--exclude=jquery.\*.js \
--exclude=jquery-\*.js \
-f"$GIT_DIRECTORY/$$.tags" $(/usr/local/bin/git ls-files)

if [[ $? -ne 0 ]]; then
  exit 1
fi

mv "$GIT_DIRECTORY/$$.tags" "$GIT_DIRECTORY/tags"

# We succeeded, reset trap and exit normally
trap - EXIT
exit 0
