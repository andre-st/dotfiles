#!/bin/sh

# Version: 2023-06-03
# Since:   2023-02-20
# About:   Downloads or opens resource in web-browser depending on filename extension (if present)
#

if [ $# -eq 0 ]
then
	>&2 echo "Usage: $0 <URL>"
	exit 1
fi


# Settings:
URL=$1
APPNAME=QuiteRSS-handle-url
XDG_DOWNLOAD_DIR=$( xdg-user-dir DOWNLOAD );  # or source "${HOME}/.config/user-dirs.dirs"
TODAY=$(date '+%Y%m%d')
ERRLOGPATH="/tmp/${APPNAME}.error.$TODAY.log"


FILENAME="${URL##*/}"                # "file.mp3?param=val"
FILENAME="${FILENAME%%\?*}"          # "file.mp3"
 FILEEXT="${FILENAME##*.}"           # "mp3"
FILENAME=$( echo "${FILENAME}" | tr '[:upper:]' '[:lower:]' )
 FILEEXT=$( echo "${FILEEXT}"  | tr '[:upper:]' '[:lower:]' )



case "${FILEEXT}" in
	mp4)
		DLDIR="${XDG_DOWNLOAD_DIR}"
		;&
	mp3|ogg)
		DLDIR="${XDG_DOWNLOAD_DIR}/mp3"
		
		# Public service radio broadcaster in own folder:
		if [[ "${FILENAME}" =~ (drk|dlf|wdr|swr|deutschlandfunk|dertag|derTag) ]]
		then
			DLDIR="${XDG_DOWNLOAD_DIR}/mp3/oer"
		fi
		
		;&
	*)
		if [ -z ${DLDIR} ]
		then
			chromium -- "${URL}"
		else
			notify-send --app-name=${APPNAME} --expire-time=5000 "Downloading" "${FILENAME}"
			
			mkdir -pf "${DLDIR}"
			
			if ! wget -q -O "${DLDIR}/${FILENAME}" -- "${URL}"
			then
				if [ ! -f "${ERRLOGPATH}" ]
				then
					echo "# wget --content-disposition --trust-server-names -i thisfile.log" > "${ERRLOGPATH}"
				fi
				
				echo "${URL}" >> "${ERRLOGPATH}"
				notify-send --app-name=${APPNAME} --urgency=critical "Error Downloading" "${FILENAME}"
				
				# Remove incomplete file:
				rm "${DLDIR}/${FILENAME}"
			fi
		fi
		;;
esac


