#!/usr/bin/env bash

set -x
set -e

rubo_files=$(git diff master --name-only |
ggrep -Ei '.rb|.rake|.podspec|.jbuilder|Gemfile|Rakefile|Podfile|Thorfile|Fastfile|Vagrantfile' |
ggrep -v _spec)

echo ""
echo ${rubo_files}
echo ""
rubocop --display-cop-names -c .rubocop.yml --force-exclusion ${rubo_files}
