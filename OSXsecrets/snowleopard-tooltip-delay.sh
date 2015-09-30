#! /bin/sh
# Even though you can't disable tooltips systemwide, you can delay them for a huge amount of time. 
# The following command makes tooltips take 10 seconds to appear in all cocoa applications:
defaults write -g NSInitialToolTipDelay -int 10000