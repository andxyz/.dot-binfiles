#!/bin/bash

set -x
set -e

rubocop -l -c .rubocop.yml --force-exclusion $(git diff master --name-only |
ggrep -Ei '(rb,.rake,.podspec,.jbuilder,Gemfile,Rakefile,Podfile,Thorfile,Fastfile,Vagrantfile)' |
ggrep -v _spec)
