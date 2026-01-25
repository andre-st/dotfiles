#!/bin/sh

# Note: Symlink this script in /etc/cron.daily


w=$(date +%V)
w=$((10#$w))   # safe against leading zero


if [ $((w % 2)) -eq 0 ]; then
	diskname="Backup 2"
else
	diskname="Backup 1"
fi


SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "$0")")" && pwd)"
pushd "$SCRIPT_DIR" > /dev/null


echo "🔄 $diskname" > bakweek.txt


popd > /dev/null
