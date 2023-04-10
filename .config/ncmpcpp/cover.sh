#!/bin/bash

#-------------------------------#
# Display current cover         #
#-------------------------------#

# todo: if cover not found in metadata, search directory for *.jpg/png
# if still nothing, use fallback issue
# currently script uses metadata for both flac and mp3

source "`ueberzug library`"

music_library="/run/media/lee/9C33-6BBD/music"
fallback_image="$HOME/.config/ncmpcpp/ncmpcpp-ueberzug/img/fallback.png"

COVER_SIZE=330
CROP_BORDER=5

get_cover() {

    ext="$(mpc --format %file% current | sed 's/^.*\.//')"

    if [ "$ext" = "flac" ]; then
        # ffmpeg cannot export embedded flac art, so use metaflac
        metaflac --export-picture-to=/tmp/mpd_cover_fullsize.jpg "$(mpc --format "$music_library"/%file% current)" >/dev/null 2>&1 &&
            ffmpeg -y -i /tmp/mpd_cover_fullsize.jpg \
                -vf "crop=min(in_w-$CROP_BORDER\,in_h-$CROP_BORDER):out_w,scale=-2:$COVER_SIZE" >/dev/null 2>&1 \
                /tmp/mpd_cover.jpg && return
    else
        ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" \
            -vf "crop=min(in_w-$CROP_BORDER\,in_h-$CROP_BORDER):out_w,scale=-2:$COVER_SIZE" >/dev/null 2>&1 \
            /tmp/mpd_cover.jpg && return
    fi

    # if no cover art found, resize and use fallback image
    ffmpeg -y -i "$fallback_image" \
        -vf "crop=min(in_w-$CROP_BORDER\,in_h-$CROP_BORDER):out_w,scale=-2:$COVER_SIZE" >/dev/null 2>&1 \
        /tmp/mpd_cover.jpg && return
}

case $1 in
    "update")
        get_cover
        exit
        ;;
esac

COVER="/tmp/mpd_cover.jpg"
X_PADDING=0
Y_PADDING=0

add_cover() {
    # if no cover file, add fallback cover to avoid error
    [ ! -f "/tmp/mpd_cover.jpg" ] &&
        ffmpeg -y -i "$fallback_image" \
            -vf "crop=min(in_w-$CROP_BORDER\,in_h-$CROP_BORDER):out_w,scale=-2:$COVER_SIZE" >/dev/null 2>&1 \
            /tmp/mpd_cover.jpg

    ImageLayer::add [identifier]="cover" [x]="$X_PADDING" [y]="$Y_PADDING" [path]="$COVER"
}

# remove_cover() {
#     ImageLayer::remove [identifier]="cover"
# }

you_wait() {
    while inotifywait -q -q -e close_write "$COVER"; do
        add_cover
    done
}

clear

ImageLayer 0< <(
    add_cover
    you_wait
)
