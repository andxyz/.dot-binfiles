#!/usr/bin/env bash

set -xe

echo "flushing dns stuff"
echo "remember to flush chrome too, see chrome://net-internals/#dns"

# mavericks 10.9
# dscacheutil -flushcache &&
# sudo killall -HUP mDNSResponder

# yosemite 10.10
# sudo discoveryutil udnsflushcaches

# yosemite 10.10.4 && elcapitan 10.11.6
dscacheutil -flushcache &&
sudo killall -HUP mDNSResponder

exit 0
