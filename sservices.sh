#!/usr/bin/env bash
#
# script to help cancel a bunch of services on my OSX dev machine
#
# to read all the plists try this
# $HOME/bin/lunchy list | $HOME/bin/mmap 'echo "\n\n\n\n\n%\n" && $HOME/bin/lunchy show %' > ~/Desktop/services.txt
#

set -e

test -f $HOME/bin/lunchy &&

# start dnsmasq for .dev domains
echo "starting dnsmasq" &&
lunchy start homebrew.mxcl.dnsmasq &&

echo "" &&
echo "current running services" &&
echo "" &&
lunchy status

exit 0
