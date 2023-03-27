#!/bin/bash

# if emacs is focused create/go to vterm buffer, else open alacritty

window=$(xdotool getactivewindow getwindowname)

if [[ "$window" != *"Emacs"* ]]; then
    alacritty;
else
    if [[ "$window" == *"vterm"* ]]; then
        emacsclient -e "(other-window 1)"
    else
        emacsclient -e "(vterm-in-directory buffer-cd)"
    fi
fi
