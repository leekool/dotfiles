#!/bin/bash

# reads the volume level in order to change the icon in ~/.fvwm/scripts/FvwmScript-VolumeIcon for the fvwm3 taskbar tray

TOGGLE=$(awk '/Left:/ {print substr($6, 2, length($6) - 2)}' <(amixer sget Master))  # 'off' for muted
VOL=$(awk '/Left:/ {print substr($5, 2, length($5) - 3)}' <(amixer sget Master))

if      [ $TOGGLE == "on" ] && [ $VOL -gt 66 ]; then ICON="stock_volume-max.png"; \
elif    [ $TOGGLE == "on" ] && [ $VOL -gt 33 ]; then ICON="stock_volume-med.png"; \
elif    [ $TOGGLE == "off" ] || [ $VOL == 0 ]; then ICON="stock_volume-mute.png"; \
else    ICON="stock_volume-min.png"; fi;

echo $ICON
