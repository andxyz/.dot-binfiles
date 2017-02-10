#!/usr/bin/env bash
# fuck that about button shit
# install current firefox thanks to https://github.com/omgmog/install-all-firefox/

set -ex

cd $HOME/code/_clone/install-all-firefox/
git pull
$HOME/code/_clone/install-all-firefox/install-all-firefox.sh "current" "en-US" "no_prompt" "/Applications/"
cd -
