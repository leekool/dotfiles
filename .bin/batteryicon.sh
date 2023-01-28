#!/bin/bash

# this reads the battery percentage in order to change the icon in ~/.fvwm/scripts/FvwmScript-BatteryIcon for the fvwm3 taskbar tray

BATTERY=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/percentage/{print substr($2, 1, length ($2) -1)}')

if      [ $BATTERY -gt 66 ]; then ICON="lee_battery_full.png";
elif    [ $BATTERY -gt 33 ]; then ICON="lee_battery_full.png";
else    ICON="lee_battery_full.png"; fi;

echo $ICON
