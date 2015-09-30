#!/bin/sh
# try and rebuild some borked osx icons
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain system -domain user \
&& killall Dock
&& killall Finder
