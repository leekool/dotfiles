#!/usr/bin/env sh

set -eu

fullscreen=$(hyprctl -j activewindow | jq -r '.fullscreen')

case "$fullscreen" in
  1|2)
    hyprctl dispatch fullscreen 0 >/dev/null
    ;;
esac

hyprctl keyword general:layout master >/dev/null
