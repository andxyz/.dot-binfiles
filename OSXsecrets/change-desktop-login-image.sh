#!/usr/bin/env bash

set -x

cp /Users/andxyz/Pictures/_wallpapers/nerdy-ironman1.png /Library/Caches/com.apple.desktop.admin.png

chown $(whoami):admin /Library/Caches/com.apple.desktop.admin.png
chmod 544 /Library/Caches/com.apple.desktop.admin.png
