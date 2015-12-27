#!/usr/bin/env ruby
#
### # shows the description and options for a bash builtin
###
### If we were looking for the options to the `jobs` builtin
###
### ```
### man_builtins.sh jobs
### man_builtins.sh ulimit
### ```
###
### please see: shellhatershandbook.org
###

# DEBUG_SHELL='set -x;'
DEBUG_SHELL=''

require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  # ruby libs
  require 'logger'

  # gems
  require 'pry'
end

needle = "#{$*.fetch(0)}"
list_of_reasonable_files_to_search_orig = %x{#{DEBUG_SHELL} find \$HOME/code/_clone/bash/builtins/\*.def -iname "*#{needle}*"}
list_of_reasonable_files_to_search = list_of_reasonable_files_to_search_orig.split(/\n/)

awk_program = '/^\$BUILTIN/, /^\$END/'
results = []

list_of_reasonable_files_to_search.each do |reasonable_file_to_search|
  description_orig = %x{#{DEBUG_SHELL} awk '#{awk_program}' < #{reasonable_file_to_search}}
  description = description_orig.gsub("\$END\n\$BUILTIN", "\$END\n\n\$BUILTIN")
  results.push({
    filename: reasonable_file_to_search,
    description: description
  })
end

puts \
"""

Searching: #{needle}
"""

results.each do |result|
  puts \
"""

Found at:
#{result.fetch(:filename)}

Description:
#{result.fetch(:description)}
"""
end

# if [ $# -ne 1 ]
# then
#    echo "Example Usage: man_builtins.sh ulimit"
#    echo "To see a list of builtins try: man builtins"
#    exit 2
# fi
