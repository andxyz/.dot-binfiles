#!/usr/bin/env ruby
#
## see https://kapeli.com/dash_install
## Prints the url to have dash install the docs for specific versions of gems in gemfile.lock
## ex open "dash-install://repo_name=Ruby%20Docsets&entry_name=activesupport&version=4.1.11"
## https://twitter.com/kapeli/status/649852908025040896
## But you can search them with the `rubygems:` docset
##
require 'open3'

stdout, _stderr, _status = Open3.capture3('bundle check || bundle install')
puts stdout

stdout_dependencies, _stderr, _status = Open3.capture3("bundle show | grep '*' | awk '{print $2, $3}' | sed -e 's/(//' -e 's/)//'")

# Or in bash shell:
# bundle list | awk -F'[ ()]+' '$2 == "*" {print "open \"dash-install://repo_name=Ruby%20Docsets&entry_name=" $3 "&version=" $4 "\"";}'

stdout_dependencies.split("\n").each do |dependency|
  (gem_name, version) = dependency.split
  next if gem_name =~ /rails-assets/

  puts "dash-install://repo_name=Ruby%20Docsets&entry_name=#{gem_name}&version=#{version}"
end
