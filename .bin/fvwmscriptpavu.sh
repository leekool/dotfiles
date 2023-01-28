#!/bin/bash

focusedwindow=$(xdotool getwindowfocus getwindowname)

if ! [ "$focusedwindow" == "Volume Mixer" ]; then
    xkill -id $(xwininfo -name "Volume Mixer" | awk 'NR==2{print $4}')
fi
