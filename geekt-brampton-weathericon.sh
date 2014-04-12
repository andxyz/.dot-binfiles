#!/bin/sh

curl --silent "http://weather.yahoo.com/canada/ontario/brampton-4431/?unit=c" | grep "forecast-icon" | sed "s/.*background\:url(\'\(.*\)\')\;\ _background.*/\1/" | xargs curl --silent -o ~/bin/geektool/weather.png 
