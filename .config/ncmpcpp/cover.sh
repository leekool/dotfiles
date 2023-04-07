#/usr/bin/env bash

#-------------------------------#
# Display current cover         #
#-------------------------------#

# todo: if cover not found in metadata, search directory for *.jpg/png
# if still nothing, use fallback issue
# currently script uses metadata for both flac and mp3

source "`ueberzug library`"

music_library="/run/media/lee/9C33-6BBD/music/"
fallback_image="$HOME/.config/ncmpcpp/ncmpcpp-ueberzug/img/fallback.png"

COVER_SIZE=441
CROP_BORDER=5

get_cover() {
    # First we check if the audio file has an embedded album art
    ext="$(mpc --format %file% current | sed 's/^.*\.//')"
    if [ "$ext" = "flac" ]; then
        # since FFMPEG cannot export embedded FLAC art we use metaflac
        # Export FLAC art to a file using metaflac
        metaflac --export-picture-to=/tmp/mpd_cover_fullsize.jpg "$(mpc --format "$music_library"/%file% current)" >/dev/null 2>&1

        # Process the file with ffmpeg
        ffmpeg -y -i /tmp/mpd_cover_fullsize.jpg \
            -vf "crop=min(in_w-$CROP_BORDER\,in_h-$CROP_BORDER):out_w,scale=-2:$COVER_SIZE" >/dev/null 2>&1 \
            /tmp/mpd_cover.jpg &&
            cover_path="/tmp/mpd_cover.jpg" && return
    else
        ffmpeg -y -i "$(mpc --format "$music_library"/%file% | head -n 1)" \
            -vf "crop=min(in_w-$CROP_BORDER\,in_h-$CROP_BORDER):out_w,scale=-2:$COVER_SIZE" >/dev/null 2>&1 \
            /tmp/mpd_cover.jpg &&
            cover_path="/tmp/mpd_cover.jpg" && return
    fi

    # # If no embedded art was found we look inside the music file's directory
    # album="$(mpc --format %album% current)"
    # file="$(mpc --format %file% current)"
    # album_dir="${file%/*}"
    # album_dir="$music_library/$album_dir"
    # found_covers="$(find "$album_dir" -type d -exec find {} -maxdepth 1 -type f \
    #     -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\\(jpe?g\|png\|gif\|bmp\)" \; )"
    # cover_path="$(echo "$found_covers" | head -n1)"

    # if [ -n "$cover_path" ]; then
    #     echo "$cover_path"
    #     return
    # fi

    # # If we still failed to find a cover image, we use the fallback
    # if [ -z "$cover_path" ]; then
    #     echo "$cover_path"
    #     cp "$fallback_image" "/tmp/mpd_cover.jpg"
    # fi
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

function add_cover() {
    ImageLayer::add [identifier]="cover" [x]="$X_PADDING" [y]="$Y_PADDING" [path]="$COVER"
}

function remove_cover() {
    ImageLayer::remove [identifier]="cover"
}

function you_wait() {
    while inotifywait -q -q -e close_write "$COVER"; do
        add_cover
    done
}

clear

ImageLayer 0< <(
    add_cover
    you_wait
)
