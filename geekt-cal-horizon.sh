#!/bin/sh

echo
echo `cal` |
  sed "s/$(date +%e) / $(date +%e | sed 's/.*/@/g') /" |
  sed s'/Su Mo Tu We Th Fr Sa//g' |
  sed s'/  */ \|  /g' |
  sed s'/^  \|//' | sed s'/\|//' | sed s'/\|/  /' |
  sed s'/\|//g' | sed s"/$/ $(date +%A)/"
