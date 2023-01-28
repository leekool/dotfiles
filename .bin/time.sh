#!/bin/bash

TIME=$(date "+%H:%M" | figlet -f lean)

IFS=$'\n'; arrTIME=($TIME); unset IFS;

# printf "%-50s%-50s%-50s%-50s%-50s" "${arrTIME[1]}" "${arrTIME[2]}" "${arrTIME[3]}" "${arrTIME[4]}" "${arrTIME[5]}"
LINE1=${arrTIME[1]}
LINE2=${arrTIME[2]}
LINE3=${arrTIME[3]}
LINE4=${arrTIME[4]}
LINE5=${arrTIME[5]}

printf "%28s%-28s%28s%-28s%28s%-28s%28s%-28s%28s%-28s"  "${LINE1:0:${#LINE1}/2}" "${LINE1:${#LINE1}/2}" \
                                                        "${LINE2:0:${#LINE2}/2}" "${LINE2:${#LINE2}/2}" \
                                                        "${LINE3:0:${#LINE3}/2}" "${LINE3:${#LINE3}/2}" \
                                                        "${LINE4:0:${#LINE4}/2}" "${LINE4:${#LINE4}/2}" \
                                                        "${LINE5:0:${#LINE5}/2}" "${LINE5:${#LINE5}/2}" \
