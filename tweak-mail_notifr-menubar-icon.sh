#!/usr/bin/env bash

set -e

cd "/Applications/Mail Notifr.app/Contents/Resources/"
sudo cp mail.tiff mail.bck.tiff
sudo cp app.tiff mail.tiff

exit 0
