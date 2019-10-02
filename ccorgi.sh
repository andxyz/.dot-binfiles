#!/usr/bin/env bash
#
# show me a few corgums

set -e
# set -x

for INDEX_I in 1 2 3
do
  CORG_URL=$(curl -s http://corginator.herokuapp.com/random?cache_bust= | jq --raw-output '.corgi')
  echo "hello from corg${INDEX_I} at ${CORG_URL}"
  open -b 'com.google.chrome' "${CORG_URL}"
done
