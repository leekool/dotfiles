#!/bin/sh

# takes a screenshot, copies to imre.al, copies URL to clipboard

FILENAME=$(date "+%d%b%y-%H:%M:%S").png

case $1 in
    "window")  # screenshots focused window
        scrot -u ~/clone/$FILENAME
        ;;
    "box")  # click and drag box
        scrot -s --freeze ~/clone/$FILENAME
        inotifywait -e close_write --include ~/Pictures/Screenshots/$FILENAME
        ;;
esac

scp ~/clone/$FILENAME root@imre.al:/home/lee/imre.al-zig/public/imre.al/images/screenshot && rm ~/clone/$FILENAME
echo "https://imre.al/images/screenshot/$FILENAME" | xclip -selection clipboard
