#!/bin/sh

/usr/local/bin/icalBuddy uncompletedTasks | grep • | sed 's/(Today)//' | sed 'G;'

