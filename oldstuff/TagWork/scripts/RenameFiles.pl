#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;


foreach my $fn (@ARGV) {
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($fn);

  #print "$fn\n";
  if( $fn =~ /^P...(\d\d\d\d).JPG/ ) {
    my $seq = $1;
    if( defined( $srcTags->{ 'DateTimeOriginal' } ) ) {
      my $dt = $srcTags->{ 'DateTimeOriginal' };
      my $newFn = $dt;
      $newFn =~ s/(\d\d\d\d):(\d\d):(\d\d) (\d\d):(\d\d):(\d\d)/$1-$2-$3 $4$5$6/;
      $newFn .= " $seq.jpg";
      if( ! -f $newFn ) {
	rename( $fn, $newFn ) || die "rename $newFn";
      }
    }
  }
}


