#!/bin/sh
curl --silent "http://weather.yahooapis.com/forecastrss?p=CAXX0043&u=c" | tr '\n' ' ' | grep -o 'Current Conditions:.*Forecast:' | sed 's/Current Conditions://' | sed 's/Forecast://' | gsed 's|<[bBR/ ]*>||Ig' | sed 's/^ *//;s/ *$//'
