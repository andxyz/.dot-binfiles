#!/bin/bash

echo "* Fetching remotes"
git fetch --all

echo "### Pruning remote branches "
# git branch prune origin

local_branches=$(git branch --merged origin/master | cut -c 2-| grep -v 'master$')
echo "### Cleaning local,merged branches '$(echo $local_branches|xargs)'"
echo ""
echo ""
echo $local_branches | xargs -I{} echo "git branch -d {}";

remote_branches=$(git branch -r --merged origin/master | grep -Ev '/(master|HEAD)$')
echo "### Cleaning remote,merged branch references '$(echo $remote_branches|xargs)'"
echo ""
echo ""
echo $remote_branches | xargs -I{} echo "git branch -d -r {}";

merged_branches=$(git for-each-ref refs/heads/ '--format=%(refname:short)' |
  while read branch; do
    mergeBase=$(git merge-base origin/master $branch) &&
    [[ $(git cherry origin/master $(git commit-tree $(git rev-parse $branch^{tree}) -p $mergeBase -m _)) == "-"* ]] &&
    echo $branch;
  done
)

echo "### Cleaning squashed,merged branches '$(echo $merged_branches|xargs)'"
echo ""
echo ""
echo $merged_branches | xargs -I{} echo "git branch -d {}";

echo "### Deleting remote branches '$(echo $remote_branches|xargs)'"
echo ""
echo ""
for b in $remote_branches; do
  # `${b/\// }` splits `origin/name` into `origin name`
  # TODO: push can accept multiple names per origin
  echo "git push --delete ${b/\// }"
  echo "https://github.com/Wonolo/platform-core/tree/${b/origin\//}"
done

echo ""
echo ""

# vim: ft=sh
