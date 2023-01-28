#!/bin/bash

# this reads the wireless signal strength in order to change the icon in ~/.fvwm/scripts/FvwmScript-NetworkIcon for the fvwm3 taskbar tray
NETWORK=$(iwconfig wlp0s20f3 | awk '/Link Quality/{split($2,a,"=|/");print int((a[2]/a[3])*100)}')

if      [ $NETWORK -gt 66 ]; then ICON="network_internet_pcs_installer-1.png";
elif    [ $NETWORK -gt 33 ]; then ICON="network_internet_pcs_installer-1.png";
elif    [ $NETWORK -z ]; then ICON="network_internet_pcs_installer-1.png";
else    ICON="network_internet_pcs_installer-1.png"; fi;

echo $ICON
