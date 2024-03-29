#!/bin/bash

# if emacs is focused create/go to vterm buffer, else open alacritty

window=$(xdotool getactivewindow getwindowname)

if [[ "$window" != *"Emacs"* ]]; then
    wezterm;
else
    if [[ "$window" == *"vterm"* ]]; then
        emacsclient -e "(other-window 1)"
    else
        emacsclient -e '(vterm-in-directory (if (buffer-file-name (window-buffer)) (file-name-directory (buffer-file-name (window-buffer))) (expand-file-name "~")))'
    fi
fi
