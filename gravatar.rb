#!/usr/bin/env ruby
#
# outputs a gravatar
# http://www.gravatar.com/avatar/f8b21b8febae9625add3d58a4557e39b?s=512
#
require 'digest/md5'
emails = ["andxyz.stevens@gmail.com", "timebot@gmail.com"]
size = 512

emails.each do |email|
  puts 'http://www.gravatar.com/avatar/' + Digest::MD5.hexdigest("#{email}") + "?s=#{size}"
end
