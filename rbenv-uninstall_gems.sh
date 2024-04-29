#!/usr/bin/env bash

# source_ruby_env() {
  test -d $HOME/.rbenv/bin &&
  export -- PATH="$HOME/.rbenv/bin:$PATH" &&
  eval "$(rbenv init -)"
# }

simple_gem_list=$(gem list --no-versions | uniq | sort | tr  "\n" " ")
read -r -a gem_list <<< "${simple_gem_list}"
for gem_name in "${gem_list[@]}"; do
  gem uninstall "${gem_name}" -aIx
done
gem list
gem install bundler
