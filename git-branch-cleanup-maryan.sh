#!/bin/bash

echo "* Fetching remotes"
git fetch

local_branches=$(git branch    --merged origin/master | cut -c 2-| grep -v 'master$')
echo "* Cleaning local,merged branches '$(echo $local_branches|xargs)'"
echo $local_branches  | xargs git branch -d

remote_branches=$(git branch -r --merged origin/master | grep -Ev '/(master|HEAD)$')
echo "* Cleaning remote,merged branch references '$(echo $remote_branches|xargs)'"
echo $remote_branches | xargs git branch -d -r

echo "* Deleting remote branches '$(echo $remote_branches|xargs)'" 
for b in $remote_branches; do
  # `${b/\// }` splits `origin/name` into `origin name`
  # TODO: push can accept multiple names per origin
  git push --delete ${b/\// }
done

# vim: ft=sh
