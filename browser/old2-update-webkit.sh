#!/bin/sh
##
## Browsers' Latest Nightly-Builds
## Version: 2010-06-09
## URL: http://mediastech.com/cat/geek/apps/
## Licence : GNU GPL v2
## Author: Mayel de Borniol
## Author URL: http://deborniol.com/
## 

appDir="/Applications";
appName="WebKit.app";
tempDir="/tmp/`whoami`/webkit-nightly/";
version=~/.CURRENT_WEBKIT_NIGHTLY;
URL=$(curl -s http://nightly.webkit.org/ | grep dmg | head -1 | perl -pe 's/.*(http.*dmg).*/$1/')
FILE=$(basename $URL)

mkdir -p $appDir 
mkdir -p $tempDir
cd $tempDir

touch $version
currentVersion=`cat $version`
echo "Currently installed version : $currentVersion"
latestVersion=$FILE
if [ "$currentVersion" == "$latestVersion" ]; then
    echo "The latest version is already installed :)"
    exit 0;
fi

echo "Downloading and unpacking $latestVersion..."
curl $URL --remote-name
hdiutil attach -quiet $tempDir/$FILE
rm $appDir/$appName
cp -R /Volumes/WebKit/WebKit.app $appDir
hdiutil detach -quiet /Volumes/WebKit
echo $latestVersion > $version
echo "Installed $latestVersion"