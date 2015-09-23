#!/usr/bin/env bash

if [ $# -ne 3 ]
then
   echo "Usage: man_section_extract man_number section command"
   exit 1
fi
man_number=$1
section=$2
command=$3

man $man_number $command> /tmp/man.txt
if [ $? -eq 0 ]
 then
 gcat /tmp/man.txt | gsed -n -e "/^$section/,/^[A-Z]/ p"| ggrep -v -e "^[A-Z]"
fi
