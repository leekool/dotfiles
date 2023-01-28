#!/bin/bash

# works out if screen active window is on contains taskbar and, if so, negates 30px from
# screen height in order to compensate for the taskbar height

# taskbar=($(currentscreenall.sh taskbar | awk 'BEGIN {FS="x"} {print $1, $2}'))
window=($(currentscreenall.sh window | awk 'BEGIN {FS="x"} {print $1, $2}'))

# if      (( ${taskbar[1]} == ${window[1]} ))
# then
#     screenheight=$(( ${window[1]} - 30 ))
# else
    screenheight=${window[1]}
# fi

width=${window[0]}
height=${window[1]}

echo "$width $height"
