#!/bin/bash

window=$(xdotool getactivewindow getwindowname)

if [[ "$window" != *"Emacs"* ]]; then
    alacritty;
else
    xdotool key super+space;
fi
