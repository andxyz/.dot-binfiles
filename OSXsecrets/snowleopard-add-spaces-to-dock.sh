#! /bin/sh
# adds an empty space tile for prettying up the dock
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'