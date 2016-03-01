dt=$1
fn=$2
if [ -z "$fn" ] ; then
  echo "usage $0 date file";
  exit 1;
fi
set -x
exiftool -overwrite_original \
     -ModifyDate="$dt" \
     -DateTimeOriginal="$dt" \
     -CreateDate="$dt" \
     $2
