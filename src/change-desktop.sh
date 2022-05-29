#!/bin/bash

cd ~/.bing-image-of-the-day/
mkdir -p wallpapers
cd wallpapers
wallpapers=$(ls)
original=${wallpapers[0]}

echo 'Original filename' "\"$original\""

if [ -f "$original" ]; then
  echo 'Renaming existing file'
  originalName="${original%.*}"
  mv $original $originalName-$RANDOM.jpg
  original=$(ls)
  echo 'Existing file from prior day was' $originalName.jpg
  echo 'Renamed to' $original
else
  echo 'No original file exists, skipping moving and reassigning to desktop wallpaper'  
fi

cd ..

if [ -f "$original" ]; then
  echo 'Setting file to another file of the same contents as the current picture'
  osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"/Users/$(whoami)/.bing-image-of-the-day/wallpapers/$original\""
fi

# Download the latest image as original name
url=$(curl -s https://www.bing.com/HPImageArchive.aspx\?format\=js\&idx\=0\&n\=1\&mkt\=en-US | /opt/homebrew/bin/jq -r '.images[0] | "https://www.bing.com" + .url')

echo 'Getting image:' $url

# From url, drop part before name and after name, example:
# https://www.bing.com/th?id=OHR.GlassBridge_EN-US6168516510_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp
filename=$(echo $url | sed -E 's/(.*\?id=)|(&rf.*)//ig')
curl $url -s -o ./wallpapers/$filename

echo 'File downloaded, preparing to install...'

# Sleep to ensure no disk buffering issue with half downloaded images
sleep 5

echo 'Setting file to background' "~/.bing-image-of-the-day/wallpapers/$filename"
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"/Users/$(whoami)/.bing-image-of-the-day/wallpapers/$filename\""

touch ~/.bing-image-of-the-day/lastrun

if [ -f "$original" ]; then
  rm wallpapers/$original
fi