#!/bin/bash

# Download the latest image as original name
url=$(curl -s https://www.bing.com/HPImageArchive.aspx\?format\=js\&idx\=0\&n\=1\&mkt\=en-US | /opt/homebrew/bin/jq -r '.images[0] | "https://www.bing.com" + .url')

echo 'Getting image:' $url
cd ~/.bing-image-of-the-day/
mkdir -p wallpapers

# From url, drop part before name and after name, example:
# https://www.bing.com/th?id=OHR.GlassBridge_EN-US6168516510_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp
filename=$(echo $url | sed -E 's/(.*\?id=)|(&rf.*)//ig')
curl $url -s -o ./wallpapers/$filename

# Sleep to ensure no disk buffering issue with half downloaded images
sleep 5

echo 'Setting file to background' "~/.bing-image-of-the-day/wallpapers/$filename"
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"/Users/$(whoami)/.bing-image-of-the-day/wallpapers/$filename\""

touch ~/.bing-image-of-the-day/lastrun
