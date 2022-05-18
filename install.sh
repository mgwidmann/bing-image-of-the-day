#!/bin/bash

mkdir -p ~/.bing-image-of-the-day
cp -R src/ ~/.bing-image-of-the-day/

(crontab -l 2>/dev/null; echo "0 12 * * * ~/.bing-image-of-the-day/change-desktop.sh") | crontab -