#!/usr/bin/env sh

# script for running xcolor from dmenu
# run xcolor, copy color to clipboard, notify (dunst)

COLOR=$(xcolor)

echo "$COLOR" | tr -d '\n' | xclip -selection clipboard
notify-send "$COLOR"
