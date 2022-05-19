#!/bin/bash

# Move the current image to yesterday's file and change to that desktop so that the new will register as a change instead of the same file again
mv ~/.bing-image-of-the-day/wallpaper.jpeg ~/.bing-image-of-the-day/yesterday.jpeg
osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"/Users/$(whoami)/.bing-image-of-the-day/yesterday.jpeg\""

# Download the latest image as wallpaper.jpeg
curl -s https://www.bing.com/HPImageArchive.aspx\?format\=js\&idx\=0\&n\=1\&mkt\=en-US | jq -r '.images[0] | "https://www.bing.com" + .url' | xargs curl -s -o ~/.bing-image-of-the-day/wallpaper.jpeg

osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"/Users/$(whoami)/.bing-image-of-the-day/wallpaper.jpeg\""
