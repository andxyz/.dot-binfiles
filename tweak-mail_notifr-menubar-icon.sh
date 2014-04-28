#!/usr/bin/env bash

set -e

cd "/Applications/Mail Notifr.app/Contents/Resources/"
sudo cp mail.png mail.bck.png
sudo cp mail@2x.png mail.png
sudo cp app.png mail.png
sudo cp app@2x.png mail@2x.png

exit 0
