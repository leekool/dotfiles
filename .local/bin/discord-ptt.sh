#!/bin/sh
for kbd in /dev/input/by-id/*-event-kbd; do
    push-to-talk -k KEY_X -n x "$kbd" &
done
wait
