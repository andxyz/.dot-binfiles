#!/usr/bin/env bash
#

set -x
set -e
set -o pipefail

docker system prune
# docker rmi -f $(docker images --filter=reference='platform*' -q)
