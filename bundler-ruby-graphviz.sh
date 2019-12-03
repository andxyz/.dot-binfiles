#!/usr/bin/env bash

brew install graphviz
hash -r

rbenv exec gem install ruby-graphviz
hash -r
rbenv rehash

rbenv exec bundle viz --help

rbenv exec bundle viz --requirements --version --without='development test' --format='png' --file='platform-core-deps-graph'
rbenv exec bundle viz --without='development test' --format='png' --file='platform-core-deps-graph2'
