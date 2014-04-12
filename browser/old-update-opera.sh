#!/bin/sh
##
## Browsers' Latest Nightly-Builds
## Version: 2010-06-09
## URL: http://mediastech.com/cat/geek/apps/
## Licence : GNU GPL v2
## Author: Mayel de Borniol
## Author URL: http://deborniol.com/
## 

my_arch="Intel";
appName="Opera Snapshot.app";
appDir="/Applications";
tempDir="/tmp/`whoami`/opera-snapshots/";
version=~/.CURRENT_OPERA_SNAPSHOT;
URL="http://my.opera.com/desktopteam/xml/rss/blog/";
FILE=$(curl -s $URL | grep dmg | head -1 | perl -pe 's/.*(http.*dmg).*/$1/')

mkdir -p $appDir
mkdir -p $tempDir
cd $tempDir

touch $version
currentVersion=`cat $version`;
echo "Currently installed version : $currentVersion"
latestVersion=$FILE;
if [ "$currentVersion" == "$latestVersion" ]; then
    echo "The latest version is already installed :)"
    exit 0;
fi

appPID=`ps wwaux|grep -v grep|grep "$appName"|awk '{print $2}'`;
if [ "$appPID" != "" ];then
	echo "Latest version available : $latestVersion";
    echo "A new version is available but $appName is running. Please quit it before trying to update.";
    exit 1;
fi

echo "Downloading and unpacking $latestVersion..."
curl "$FILE" --remote-name
hdiutil attach -quiet "$tempDir/${FILE##*/}"
rm "$appDir/$appName"
cp -R /Volumes/Opera/Opera.app "$appDir/$appName"
hdiutil detach -quiet /Volumes/Opera
echo $latestVersion > $version
echo "Installed $latestVersion"
