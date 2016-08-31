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

### some odd snippets
# grep -R -i '$FUNCTION' ~/code/_clone/bash
# bash -x -c 'trap -l'

require 'bundler'
require 'bundler/inline'
# require 'bundler/ui/silent'

# https://github.com/bundler/bundler/blob/d23c26442a0e4caec73b5f85c21fc4738c7bc19f/lib/bundler/inline.rb#L31
gemfile(true, { ui: Bundler::UI::Silent.new }) do
  source 'https://rubygems.org'
  # ruby libs
  require 'logger'

  # gems
  gem 'posix-spawn', '~> 0.3.11'
  # gem 'pry-byebug'
end

@log = Logger.new(STDOUT)
@log.level = Logger::INFO
# @log.level = Logger::DEBUG

at_exit do
  if !($ERROR_INFO.nil? || $ERROR_INFO.is_a?(SystemExit) && $ERROR_INFO.success?)
    code = $ERROR_INFO.is_a?(SystemExit) ? $ERROR_INFO.status : 1
    puts "failure with code: #{code}"
    # puts "I need to think of something better than at_exit"
    puts "Example Usage: man_builtins.sh ulimit"
    puts "To see a list of builtins try: man builtins"
    exit 1
  end
end

# DEBUG_SHELL='set -x;setopt printexitvalue;'
DEBUG_SHELL=''

# for ARGV aka $* see http://ruby-doc.org/stdlib-2.3.1/libdoc/English/rdoc/English.html
needle = "#{ARGV.fetch(0)}"
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
searching ::: #{needle}
"""

results.each do |result|
    output += \
"""
found_at ::: #{result.fetch(:filename)}

description :::
#{result.fetch(:description)}
"""
end

puts output if results.size > 0

exit 0
