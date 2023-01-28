#!/bin/sh

# script to work with emacs daemon - opens file in new window if emacs isn't open
# opens file in existing emacs window if emacs is open
# if no argument is provided, opens doom-dashboard in new frame/current frame
# depending on whether emacs is already open

# returns 't' if emacs is open
OPEN=$(emacsclient -n -e "(> (length (frame-list)) 1) | grep -q t")

# if no arguments are provided
if [ "$#" -eq 0 ]; then
    if [ "$OPEN" != t ]; then
        emacsclient -c -n
        exit 1
    else
        emacsclient -e "(+doom-dashboard/open (selected-frame))"
        exit 1
    fi
fi

# if an argument is provided
if [ "$OPEN" = t ]; then
    emacsclient -n -a "" "$1"
else
    emacsclient -c -n -a "" "$1"
fi
