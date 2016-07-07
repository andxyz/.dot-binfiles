#!/usr/bin/env ruby
# ideas from https://gist.github.com/mpeteuil/6147292
require 'rubocop'

VALID_FILE_EXT = %w(.rb .rabl .rake)
FILENAME_EXCLUDES = %w(schema.rb _spec.rb)

rubocop_config_file = File.exist?('.rubocop.yml') ? '.rubocop.yml' : '.hound.yml'

interesting_files = `git diff --cached --diff-filter AM --name-only`.split(/\n/).
  select { |file_name|
    VALID_FILE_EXT.include? File.extname(file_name)
  }.
  select { |file_name|
    FILENAME_EXCLUDES.all? do |exclude_pattern|
      !file_name.include?(exclude_pattern)
    end
  }
puts interesting_files.join('\n')
system("set -x; rubocop --display-cop-names --config #{rubocop_config_file} #{interesting_files.join(' ')}; set +x") unless interesting_files.empty?

exit $CHILD_STATUS.to_s[-1].to_i
