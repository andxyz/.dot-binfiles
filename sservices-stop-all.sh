#!/usr/bin/env bash
#
# script to help cancel a bunch of services on my OSX dev machine
#
# to read all the plists try this:
#
# ```shell
# lunchy list | xargs -I{} lunchy show {}
# ```

set -e
# set -x

test -n $(which lunchy) || exit 0

echo ""
echo "current running services"
echo ""

lunchy status

echo ""
echo "stopping stuff"
echo ""

lunchy stop 'homebrew.mxcl.dnsmasq'
lunchy stop 'homebrew.mxcl.postgresql@9.5'

echo ""
echo "current running services"
echo ""

lunchy status

exit 0
