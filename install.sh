#!/bin/bash

mkdir -p ~/.bing-image-of-the-day

cp -R src/ ~/.bing-image-of-the-day/
cd ~/.bing-image-of-the-day/

mv BingImageOfTheDayWallpaper.app ~/Applications/

plist=$(envsubst < net.bing-image-of-the-day.plist)
echo $plist > net.bing-image-of-the-day.plist

PLIST_FILE=~/Library/LaunchAgents/net.bing-image-of-the-day.plist

if [ -f $PLIST_FILE ]; then
  launchctl unload $PLIST_FILE
fi

launchctl remove "net.bing-image-of-the-day"

ln -sfv ~/.bing-image-of-the-day/net.bing-image-of-the-day.plist ~/Library/LaunchAgents/
launchctl load $PLIST_FILE

(crontab -l 2>/dev/null; echo "5 15 * * * ~/.bing-image-of-the-day/change-desktop.sh") | crontab -

osascript -e "tell application \"System Events\" to make login item at end with properties {path:\"/Users/$(whoami)/Applications/BingImageOfTheDayWallpaper.app\", hidden:true}" > /dev/null