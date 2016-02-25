#!/bin/bash
# 2016-01-10 (cc) <paul4hough@gmail.com>
#

if [ -z "$4" ] ; then
  echo "$0 fn date nloc wloc title desc";
  exit 1;
fi

fn="$1"
dt="$2"
nloc="$3"
wloc="$4"
title="$5"
desc="$6"

if [ -n "$5" ] ; then
  tagname="-ObjectName=$title"
fi
if [ -n "$6" ] ; then
  tagdesc="-Caption-Abstract=$desc"
fi
set -x
exiftool $fn					\
  -overwrite_original				\
  -Keywords=Houghton				\
  -DateTimeOriginal="$dt"			\
  -GPSLatitudeRef=N -GPSLongitudeRef=W		\
  -GPSLatitude="$nloc"				\
  -GPSLongitude="$wloc"				\
  "$tagname"
