#!/bin/sh

MINUTES=${1:-now}

# Stralsund (GitHub):
GEOLAT=54.301359
GEOLONG=13.075093

# Stop last shutdown timer
sudo /sbin/shutdown -c

if [ "${MINUTES}" != "now" ]
then
	redshift -l "${GEOLAT}:${GEOLONG}" -m vidmode &
fi

sudo /sbin/shutdown -h ${MINUTES}




