#!/bin/bash

# loop through each m4a file in the current directory
for file in *.m4a; do
  # get the base filename without the extension
  filename=$(basename -- "$file")
  filename="${filename%.*}"

  # convert m4a to flac using ffmpeg
  ffmpeg -i "$file" "${filename}.flac"
done

