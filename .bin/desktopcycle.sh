#!/bin/sh

CURRENT=$(xdotool get_desktop)

case $CURRENT in
    0)
        DESK="I"
        COMMAND="GotoDesk 0 1"
        ;;
    1)
        DESK="II"
        COMMAND="GotoDesk 0 2"
        ;;
    2)
        DESK="III"
        COMMAND="GotoDesk 0 3"
        ;;
    3)
        DESK="IV"
        COMMAND="GotoDesk 0 0"
        ;;
esac

case $1 in
    "desk")
        echo $DESK
        ;;
    "goto")
        echo $COMMAND
        ;;
esac
