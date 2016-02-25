fn=$1
base=`basename "$fn" .JPG`
d=`dirname "$fn"`
#echo $fn
#echo $base
mv "$fn" "$d/$base"
mv "$d/$base" "$d/$base.jpg"
