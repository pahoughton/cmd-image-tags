#!/bin/bash
# 2015-12-24 (cc) <paul4hough@gmail.com>
#
#set -x

lat=$1
shift
lon=$1
shift

if [ -z "$lon" ] ; then
  echo usage $0 lat lon filenames
  exit 1
fi

for fn in $* ; do
  exiftool -overwrite_original			\
	   -GPSLatitudeRef=N -GPSLongitudeRef=W	\
	   -GPSLatitude="$lat"			\
	   -GPSLongitude="$lon"			\
	   "$fn"
done
