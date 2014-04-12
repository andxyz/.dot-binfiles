#!/usr/bin/env bash

set -e

echo "flushing mavericks dns stuff"
echo "remember to flush chrome too, see chrome://net-internals/#dns"

dscacheutil -flushcache &&
sudo killall -HUP mDNSResponder

exit 0
