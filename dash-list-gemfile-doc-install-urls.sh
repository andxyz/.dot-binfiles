#!/usr/bin/env bash
## see https://kapeli.com/dash_install
## Prints the url to have dash install the docs for specific versions of gems in gemfile.lock
## ex open "dash-install://repo_name=Ruby%20Docsets&entry_name=activesupport&version=4.1.11"
## However there is currently no way to get them into a custom docset for each appname
## https://twitter.com/kapeli/status/649852908025040896
## But you can search them with the `rubygems:` docset

set -e
set -x


bundle check || bundle install
bundle list | awk -F'[ ()]+' '$2 == "*" {print "open \"dash-install://repo_name=Ruby%20Docsets&entry_name=" $3 "&version=" $4 "\"";}'
