#!/usr/bin/env bash

set -x

rubo_files=$(git diff --diff-filter AM --name-only master |
ggrep -Ei '.rb|.rake|.podspec|.jbuilder|Gemfile|Rakefile|Podfile|Thorfile|Fastfile|Vagrantfile')


# "Run it twice, once with rubocop enforcement, once without"
echo ""
echo ""

bundle exec rubocop --display-cop-names --config ./.rubocop.yml --force-exclusion ${rubo_files}
