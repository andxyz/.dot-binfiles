#!/usr/bin/env bash

git for-each-ref --sort='-committerdate' --format='%(committerdate:iso8601) %(authoremail) %(refname)'
