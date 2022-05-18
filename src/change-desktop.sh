#!/bin/bash

curl -s https://www.bing.com/HPImageArchive.aspx\?format\=js\&idx\=0\&n\=1\&mkt\=en-US | jq -r '.images[0] | "https://www.bing.com" + .url' | xargs curl -s -o ~/.bing-image-of-the-day/wallpaper.jpeg

osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"/Users/$(whoami)/.bing-image-of-the-day/wallpaper.jpeg\""
