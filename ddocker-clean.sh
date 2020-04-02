#!/usr/bin/env bash
#

set -x
set -e
set -o pipefail

docker system prune -a -f

# all of them the old fasioned way
# docker rmi $(docker images -q) -f

# or maybe filter some
# docker rmi -f $(docker images --filter=reference='platform*' -q)

