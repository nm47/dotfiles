#!/usr/bin/env bash

# If an instance of wf-recorder is running under this user kill it with SIGINT and exit
pkill --euid "$USER" --signal SIGINT wf-recorder

# Define paths
DefaultSaveDir=$HOME'/Videos'
TmpPathPrefix='/tmp/gif-record'
TmpRecordPath=$TmpPathPrefix'-cap.mp4'
TmpPalettePath=$TmpPathPrefix'-palette.png'


# Set umask so tmp files are only acessible to the user
umask 177

case $1 in
  region) wf-recorder -g "$(slurp)" -f "$TmpRecordPath" || exit;;
  window) wf-recorder -g "$(
    swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp
  )" -f "$TmpRecordPath";;
  save) 
      # Get the filename from the user and honor cancel
      SavePath=$( zenity \
    	  --file-selection \
    	  --save \
    	  --confirm-overwrite \
    	  --file-filter=*.gif \
    	  --filename="$DefaultSaveDir"'/.gif' \
    	  );
    
      # Append .gif to the SavePath if it's missing
      [[ $SavePath =~ \.gif$ ]] || SavePath+='.gif';

      # Produce a pallete from the video file
      ffmpeg -i "$TmpRecordPath" -filter_complex "palettegen=stats_mode=full" "$TmpPalettePath" -y;

      # Return umask to default
      umask 022;

      # Use pallete to produce a gif from the video file
      ffmpeg -i "$TmpRecordPath" -i "$TmpPalettePath" -filter_complex "paletteuse=dither=sierra2_4a" "$SavePath" -y;

      [[ -f $TmpRecordPath ]] && rm -f "$TmpRecordPath";
      [[ -f $TmpPalettePath ]] && rm -f "$TmpPalettePath";;
esac

