set -x

pdt=$1
fn=$2

if [ -z "$pdt" ] ; then
  echo "usage: $0 date fn"
  exit 1;
fi

exiftool -overwrite_original \
	 -ModifyDate="$pdt" \
	 -DateTimeOriginal="$pdt" \
	 -CreateDate="$pdt" \
	 "$fn"
