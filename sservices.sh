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
set -x

test -n $(which lunchy) || exit 0

# start dnsmasq for .dev domains
echo "starting dnsmasq"
lunchy start homebrew.mxcl.dnsmasq

echo ""
echo "current running services"
echo ""

lunchy status

exit 0
