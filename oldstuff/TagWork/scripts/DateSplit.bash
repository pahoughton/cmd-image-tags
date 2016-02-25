for fn in * ; do
  dt=`echo $fn | sed 's/^\(....-..-..\).*/\1/'`
  echo $dt
  [ -d "../Work/$dt" ] || mkdir "../Work/$dt"
  mv "$fn" "../Work/$dt/" || exit
done