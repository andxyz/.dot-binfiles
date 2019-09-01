#!/usr/bin/env bash

set -x
set -e

rubo_files=$(git diff --diff-filter AM --name-only production |
ggrep -Ei '.rb|.rake|.podspec|.jbuilder|Gemfile|Rakefile|Podfile|Thorfile|Fastfile|Vagrantfile')

echo "using these files:"
echo $rubo_files
echo ""

bundle exec rubocop --display-cop-names --config .rubocop.yml --force-exclusion ${rubo_files}

