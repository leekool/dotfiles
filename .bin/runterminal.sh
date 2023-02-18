#!/bin/bash

# if emacs is focused create/go to vterm buffer, else open alacritty

window=$(xdotool getactivewindow getwindowname)

if [[ "$window" != *"Emacs"* ]]; then
    alacritty;
else
    emacsclient -e "(vterm-toggle)"
fi
