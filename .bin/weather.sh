#!/bin/bash

readarray -t weather < <(curl -s "wttr.in/sydney?format=%C\n%t")

weather[1]=$(echo ${weather[1]} | tr -d '+C')

case "${weather[0],,}" in  # ',,' converts string to lowercase
   *"cloudy"*)
      weather[0]="Cloudy"
      ;;
   *"shower"*)
      weather[0]="Showers"
      ;;
esac

echo "${weather[0]^^} ${weather[1]}"
