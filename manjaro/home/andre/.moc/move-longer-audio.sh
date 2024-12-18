#!/bin/bash

# Requires:
# - mediainfo (preinstalled on Manjaro-Minimal) or SoX package (soxi tool)
#
# Configure [F4] key in Music on Console to run this script


SOURCE_DIR="$HOME/Downloads/mp3"
TARGET_DIR="$HOME/Downloads/mp3/[F4]-longer"
SHORT_AUDIO_MINUTES_MAX=25


echo "Moving longer audio files to $TARGET_DIR..."

mkdir -p "${TARGET_DIR}"

pushd "$SOURCE_DIR" > /dev/null;
shopt -s nullglob
IFS=$'\n'


for f in *.{mp3,wav,ogg,oga}
do
	# Bash does not accept floating point numbers
	
	# duration_secs_flt=$( soxi -D "$f" )
	# duration_secs_int=${duration_secs_flt%.*}
	
	duration_msec_int=$( mediainfo --Inform="Audio;%Duration%" "$f" )
	duration_secs_int=$(( duration_msec_int / 1000 ))
	duration_mins_int=$(( duration_secs_int / 60 ))
	
	if (( duration_mins_int > $SHORT_AUDIO_MINUTES_MAX ))
	then
		echo "* Moving \"$f\" ($duration_mins_int min)"
		mv "$f" "$TARGET_DIR"
	fi
done

shopt -u nullglob
popd > /dev/null


read -p "Press any key to continue..."



