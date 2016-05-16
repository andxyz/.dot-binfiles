#!/usr/bin/env ruby
###
### # shows the description and options for a bash builtin
###
### Say we were looking for the options to the `jobs` builtin
###
### ```
### man_builtins.sh jobs
### man_builtins.sh ulimit
### ```
###
### because `man ulimit` is terrible
###
### please see: http://shellhaters.org/
###

require 'bundler'
require 'bundler/inline'
# require 'bundler/ui/silent'

# https://github.com/bundler/bundler/blob/d23c26442a0e4caec73b5f85c21fc4738c7bc19f/lib/bundler/inline.rb
gemfile(install: true, options: { ui: Bundler::UI::Silent.new }) do
  source 'https://rubygems.org'
  # ruby libs
  require 'logger'

  # gems
  # gem 'pry', '~> 0.10.3'
  gem 'posix-spawn', '~> 0.3.11'
end

@log = Logger.new(STDOUT)
@log.level = Logger::INFO
# @log.level = Logger::DEBUG

at_exit do
  if $!
    puts "I need to think of something better than at_exit"
    puts "Example Usage: man_builtins.sh ulimit"
    puts "To see a list of builtins try: man builtins"
    exit 2
  end
end

# DEBUG_SHELL='set -x;setopt printexitvalue;'
DEBUG_SHELL=''

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

output = ""

output += \
"""
searching :: #{needle}
"""

results.each do |result|
    output += \
"""
found_at :: #{result.fetch(:filename)}

description ::
#{result.fetch(:description)}
"""
end

@log.info(output) if results.size > 0

exit 0
