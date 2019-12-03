#!/usr/bin/env bash

set -x

cp /Users/andrew/Pictures/_andxyz/_wallpaper/important-wonolo-doggo-zoomer-rumpus.png /Library/Caches/com.apple.desktop.admin.png

chown $(whoami):admin /Library/Caches/com.apple.desktop.admin.png
chmod 544 /Library/Caches/com.apple.desktop.admin.png
