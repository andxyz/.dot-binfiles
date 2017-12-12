#!/bin/bash
# see https://github.com/MikeMcQuaid/scripts/blob/65fe2cef84f77931082f2e56cb9aee4bc6f58594/git-commit-each

# Commit all modified files in commits with one modified file per commit
for FILENAME in $(git ls-files --modified --others)
do
  MESSAGE="$(echo "$FILENAME" | sed -e 's|^Library/Homebrew/||' \
                                     -e 's|^Formula/||' \
                                     -e 's|^Casks/||' \
                                     -e 's/\.rb//' \
                                     -e 's/$/: /')"
  git add "$FILENAME"
  git commit "$FILENAME" --message="${MESSAGE}${*}"
done
