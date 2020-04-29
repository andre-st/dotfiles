#!/bin/sh

FLAGFILE="/dev/shm/xcalib-inverted.flag"


if [ -f "${FLAGFILE}" ]
then
	xcalib -clear && rm "${FLAGFILE}"
else
	xcalib -invert -contrast 60 -alter && touch "${FLAGFILE}"
fi


