#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;

my @Tags = ( "DateTimeOriginal",
	     "Keywords",
	     "Location",
	     "City",
	     "Province-State",
	     "PostalCode",
	     "GPSLatitudeRef",
	     "GPSLongitudeRef",
	     "GPSLatitude",
	     "GPSLongitude",
	     "ObjectName",
	     "Caption-Abstract",
	     "XPComment" );

foreach my $fn (@ARGV) {
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($fn);

  print "$fn\n";
  foreach my $loc (@Tags) {
    if( defined( $srcTags->{ $loc } ) ) {
      print "$loc: ",$srcTags->{ $loc },"\n";
    }
  }
  print "\n";


}


