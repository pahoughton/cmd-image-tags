#!/bin/bash
# 2015-12-24 (cc) <paul4hough@gmail.com>
#
#set -x

fn=$1
lat=$2
lon=$3

if [ -z "$lon" ] ; then
  echo no longitude
  exit 1
fi

echo update $fn $lat $lon
exiftool -overwrite_original \
	 -Keywords=Houghton \
	 -GPSLatitudeRef=N -GPSLongitudeRef=W \
	 -GPSLatitude="$lat" \
	 -GPSLongitude="$lon" \
	 "$fn"
