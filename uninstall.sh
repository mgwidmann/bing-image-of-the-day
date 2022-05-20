#!/bin/bash

osascript -e 'tell application "System Events" to delete login item "BingImageOfTheDayWallpaper"'

crontab -l | grep -v '~/.bing-image-of-the-day/change-desktop.sh'  | crontab -

rm -rf ~/Applications/BingImageOfTheDayWallpaper.app ~/.bing-image-of-the-day

unlink ~/Library/LaunchAgents/net.bing-image-of-the-day.plist