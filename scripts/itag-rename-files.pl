#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;


foreach my $fn (@ARGV) {
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($fn);

  # print "$fn\n";

  my $dt;
  my $dtsrc;
  if( defined( $srcTags->{ 'DateTimeOriginal' } ) ) {
    $dt = $srcTags->{ 'DateTimeOriginal' };
    $dtsrc = 'dto';
  } elsif( defined( $srcTags->{'CreateDate'} ) ) {
    $dt = $srcTags->{ 'CreateDate' };
    $dtsrc = 'cdt';
  } else {
    #print "ndt $fn\n";
    print "NODT $fn\n";
    next;
  }


  my $newfn = $dt;
  $newfn =~ s/(\d\d\d\d):(\d\d):(\d\d) (\d\d):(\d\d):(\d\d)/$1-$2-$3.$4$5$6-$fn/;
  if( ! -f $newfn ) {
    rename( $fn, $newfn ) || die "rename $fn $newfn";
    print("rn '$fn' '$newfn'\n");
  } else {
    print "OOPS dup $fn\n";
  }
}
