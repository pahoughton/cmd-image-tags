#!/bin/bash
# 2015-12-24 (cc) <paul4hough@gmail.com>
#
set -x
for fn in $*; do
  exiftool -overwrite_original \
    -Keywords=Houghton \
    -City=Walpole -Province-State=NH -PostalCode=03608 \
    -GPSLatitudeRef=N -GPSLongitudeRef=W \
    -GPSLatitude=43.084167 \
    -GPSLongitude=-72.435940 \
    "$fn"
done
