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
