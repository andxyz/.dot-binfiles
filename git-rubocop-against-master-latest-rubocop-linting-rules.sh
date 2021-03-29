#!/usr/bin/env bash

rubo_files=$(git diff --diff-filter AM --name-only master | xargs -I{} ls $PWD/{} |
ggrep -Ei '.rb|.rake|.podspec|.jbuilder|Gemfile|Rakefile|Podfile|Thorfile|Fastfile|Vagrantfile')

echo ""
echo ""

cd "${HOME}"/code/rubocop_linting/

set -x
set -e

bundle exec rubocop --require rubocop-rspec --display-cop-names --config "${HOME}"/code/rubocop_linting/.rubocop.yml --force-exclusion ${rubo_files}
