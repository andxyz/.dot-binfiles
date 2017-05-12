#!/usr/bin/env bash

set -x
set -e

rubo_files=$(git diff --diff-filter AM --name-only master |
ggrep -Ei '.rb|.rake|.podspec|.jbuilder|Gemfile|Rakefile|Podfile|Thorfile|Fastfile|Vagrantfile')

echo ""
echo ""

bundle exec rubocop --display-cop-names --config .rubocop.yml --force-exclusion ${rubo_files}
