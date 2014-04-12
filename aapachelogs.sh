#!/bin/sh

cd /Applications/MAMP/Library/logs && ls

echo "\n cd /Applications/MAMP/Library/logs"
echo "\n tail -f `ls *log | head -1` \n"

