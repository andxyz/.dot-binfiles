#!/usr/bin/env bash

brew install graphviz
hash -r

rbenv exec gem install ruby-graphviz
hash -r
rbenv rehash

# hmmmm, things have changed
#
# see https://github.com/rubygems/bundler-graph

# rbenv exec bundle graph --help

rbenv exec bundle viz --requirements --version --without='development test' --format='jpeg' --file='platform-core-deps-graph'

# rbenv exec bundle graph --requirements --version --without='development test' --format='png' --file='platform-core-deps-graph'
# rbenv exec bundle graph --without='development test' --format='png' --file='platform-core-deps-graph2'
