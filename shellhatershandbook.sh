#! /bin/bash
# just learning some shell thanks to ryan tomayko
# http://shellhaters.org/
# for docs see http://shellhaters.org/

set -e
/usr/local/bin/http http://shellhaters.org/ |
tr -c "a-zA-Z" "\n"           |
grep -v  '^$'                 |
sort                          |
uniq -c                       |
sort -rn                      |
head -25
