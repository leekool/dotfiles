#!/usr/bin/env sh

set -eu

current=$(hyprctl getoption general:layout | awk '/str:/ { print $2 }')

case "$current" in
  master)
    hyprctl keyword general:layout dwindle >/dev/null
    ;;
  dwindle|*)
    hyprctl keyword general:layout master >/dev/null
    ;;
esac
