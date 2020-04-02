#!/usr/bin/env ruby


puts "something like this:\n"

example_usage = <<~EOF
echo "\\
protocol=https
host=github.com
username=$NAME
password=$PASSWD" | git credential-osxkeychain store
EOF

puts example_usage


# export -- NAME='mygithubname'
# export -- PASSWD='omgmygithub_passwd_token_ishere'

# echo "\
# protocol=https
# host=github.com
# username=$NAME
# password=$PASSWD" | git credential-osxkeychain store

# unset NAME
# unset PASSWD
