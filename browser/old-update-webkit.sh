#!/bin/sh
#Automatically update to the latest WebKit nightly build.
#By Zach Drayer, zach@drayer.name
#-----------------------------------------------------------------------------
#Set environment up
#-----------------------------------------------------------------------------
export LOGGING_LOCATION="$HOME"/Library/Logs/WebKitUpdate.log
export WEBKIT_BACKUP_LOCATION=""$HOME"/Documents/WebKit Backup/"
curl -LOs "http://nightly.webkit.org/index.html" 
export WEBKIT_NIGHTLY_BUILT_VERSION=`cat index.html | grep mac/WebKit-SVN | grep Download | cut -c 47-51`
if [ -d /Applications/WebKit.app ]; then
  export WEBKIT_INSTALLED_VERSION=`cat /Applications/WebKit.app/Contents/Resources/VERSION`
  if [ "$WEBKIT_NIGHTLY_BUILT_VERSION" == "$WEBKIT_INSTALLED_VERSION" ]; then
    exit
  fi
fi
export WEBKIT_TEMP_INSTALL_LOCATION="/tmp/WebKit-$WEBKIT_NIGHTLY_BUILT_VERSION-$RANDOM"
mkdir "$WEBKIT_TEMP_INSTALL_LOCATION"
cd "$WEBKIT_TEMP_INSTALL_LOCATION"
#-----------------------------------------------------------------------------
#Checks if WebKit is running or not
#-----------------------------------------------------------------------------
ps aux | grep Web >> web.txt
cat web.txt | grep WebKit >> web2.txt
WEBKIT_RUNNING=`cat web2.txt`
if [ "$WEBKIT_RUNNING" != "" ]; then
  kill -9 `cat web2.txt | sed s/"$USER"      //g | cut -c 1-5`
fi
#-----------------------------------------------------------------------------
#Back WebKit up
#-----------------------------------------------------------------------------
if [ -d /Applications/Webkit.app ]; then
  #Comment out this if/elseif block if you don't want to back WebKit up
  #Start commenting below --v
#	if [ -d "$WEBKIT_BACKUP_LOCATION" ]; then
#		mv /Applications/WebKit.app "$WEBKIT_BACKUP_LOCATION"WebKit-r"$WEBKIT_INSTALLED_VERSION".app
#	else
#		mkdir "$WEBKIT_BACKUP_LOCATION"
#		mv /Applications/WebKit.app "$WEBKIT_BACKUP_LOCATION"WebKit-r"$WEBKIT_INSTALLED_VERSION".app
#	fi
	curl -LOs "http://nightly.webkit.org/files/trunk/mac/WebKit-SVN-r"$WEBKIT_NIGHTLY_BUILT_VERSION".dmg"
else
  #Stop Commmenting here --^
#Also uncomment the next line if you dont back WebKit up
#	rm -rf /Applications/WebKit.app
	curl -LOs "http://nightly.webkit.org/files/trunk/mac/WebKit-SVN-r"$WEBKIT_NIGHTLY_BUILT_VERSION".dmg"
fi
#-----------------------------------------------------------------------------
#Install WebKit
#-----------------------------------------------------------------------------
hdiutil attach -quiet "$WEBKIT_TEMP_INSTALL_LOCATION"/WebKit-SVN-r"$WEBKIT_NIGHTLY_BUILT_VERSION".dmg
cp -R /Volumes/WebKit/WebKit.app /Applications/
hdiutil detach -quiet /Volumes/WebKit
rm -rf "$WEBKIT_TEMP_INSTALL_LOCATION"
#-----------------------------------------------------------------------------
#Logging
##Comment this block out if you dont want a log of 
#-----------------------------------------------------------------------------
echo "WebKit build " $WEBKIT_NIGHTLY_BUILT_VERSION " replaced build " $WEBKIT_INSTALLED_VERSION " on " `date` 
>> $HOME/Library/Logs/WebKitUpdate.log