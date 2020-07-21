#!/usr/bin/env bash

set -x
set -e

rubo_files=$(git diff --diff-filter AM --name-only master |
ggrep -Ei '.rb|.rake|.podspec|.jbuilder|Gemfile|Rakefile|Podfile|Thorfile|Fastfile|Vagrantfile')

echo ""
echo ""

/Users/andrew/wonolo/rubocop_linting/bin/bundle exec rubocop --display-cop-names --config /Users/andrew/wonolo/rubocop_linting/.rubocop.yml --force-exclusion ${rubo_files}
