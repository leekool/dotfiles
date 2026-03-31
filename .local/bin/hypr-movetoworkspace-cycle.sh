#!/usr/bin/env sh

set -eu

[ $# -eq 1 ] || {
  printf 'usage: %s {left|right}\n' "$0" >&2
  exit 1
}

direction=$1
current=$(hyprctl -j activeworkspace | jq -r '.id')

case "$current" in
  ''|null)
    exit 1
    ;;
esac

case "$direction" in
  left)
    if [ "$current" -le 1 ]; then
      target=6
    else
      target=$((current - 1))
    fi
    ;;
  right)
    if [ "$current" -ge 6 ]; then
      target=1
    else
      target=$((current + 1))
    fi
    ;;
  *)
    printf 'usage: %s {left|right}\n' "$0" >&2
    exit 1
    ;;
esac

hyprctl dispatch movetoworkspacesilent "$target" >/dev/null
