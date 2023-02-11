#!/usr/bin/env sh

# script for running xcolor from dmenu
# run xcolor, copy color to clipboard, notify (dunst)

COLOR=$(xcolor)

echo "$COLOR" | xclip -selection clipboard
notify-send "$COLOR"
