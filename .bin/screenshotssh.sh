#!/bin/sh

# takes a screenshot, uploads to imre.al, copies URL to clipboard

FILENAME=$(date "+%d%b%y-%H:%M:%S").png

case $1 in
    "window")  # screenshots focused window
        scrot -u ~/Pictures/Screenshots/$FILENAME
        ;;
    "box")  # click and drag box
        scrot -s ~/Pictures/Screenshots/$FILENAME
        inotifywait -e close_write --include ~/Pictures/Screenshots/$FILENAME
        ;;
esac

scp ~/Pictures/Screenshots/$FILENAME root@imre.al:/var/www/html/image/screenshot && rm ~/Pictures/Screenshots/$FILENAME
echo "https://imre.al/image/screenshot/$FILENAME" | xclip -selection clipboard
