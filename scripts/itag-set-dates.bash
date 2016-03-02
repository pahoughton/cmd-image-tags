set -x

dt=$1
shift;
if [ -z "$dt" ] ; then
  echo "usage: $0 date filenames"
  exit 1
fi

cnt=0;
for fn in $* ; do
  psec=`printf %02d $cnt`
  pdt="$dt:$psec"
  let "cnt += 1"
  exiftool -overwrite_original \
       -ModifyDate="$pdt" \
       -DateTimeOriginal="$pdt" \
       -CreateDate="$pdt" \
       "$fn"
done
