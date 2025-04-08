#!/usr/bin/env bash

set -ex

bundle exec rubocop --display-cop-names --display-style-guide --debug **.rb **.sh

exit 0
