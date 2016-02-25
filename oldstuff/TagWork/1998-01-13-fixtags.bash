min=1
for fn in 1998-01-13*; do
mn=`printf "%02d" $min`;
exiftool -overwrite_original \
    -Keywords=Houghton \
    -DateTimeOriginal="1998-01-13 01:$mn:00" \
    -Location="Silver Image Studios" \
    -City="Colorado Springs" -Province-State=CO \
    -GPSLatitudeRef=N -GPSLongitudeRef=W \
    -GPSLatitude=38.947553 \
    -GPSLongitude=-104.744797 \
    -ObjectName="Patty" \
    -Caption-Abstract="Patricia Ann Houghton(36)" \
    "$fn"
let min=$min+1
done
