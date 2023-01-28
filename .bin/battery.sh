#!/bin/bash

status="$(cat /sys/class/power_supply/BAT0/status 2>&1)"
capacity="$(cat /sys/class/power_supply/BAT0/capacity 2>&1)"

case $1 in
	"status")
		echo "${status^^}"
		;;
	"capacity")
		echo BAT: "$capacity"%
		;;
esac
