#!/bin/bash

# Loop through each mp4 file in the current directory
for file in *.m4a; do
  # Get the base filename without the extension
  filename=$(basename -- "$file")
  filename="${filename%.*}"

  # Convert mp4 to flac using ffmpeg
  ffmpeg -i "$file" "${filename}.flac"
done

