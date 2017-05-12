#!/usr/bin/env bash
# show the list of outdated gems

set -x # prints each command in a script to stderr before running it.
set -e
set -o pipefail # Pipelines fail on the first command which fails instead of dying later on down the pipeline.

bundle outdated || true

bundle outdated --parseable | awk -F' ' '{print $1}'
