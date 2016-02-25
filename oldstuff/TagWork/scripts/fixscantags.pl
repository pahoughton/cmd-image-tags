#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;

my $city="Glendale";
#$city="Phoenix";
my $state="AZ";
my $location="5047 W Belmont";
#$location="Phoenix Zoo; 455 N Galvin Pkwy";

while( <> ) {
  chop;
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($_);

  my $dt;
  my $title;
  if( /(\d\d\d\d-\d\d-\d\d)-scan(\d\d)(\d\d).jpg/ ) {
    $dt = "$1 $2:$3:00";
    $title = "scan";;
  }

  #print "$_\n$dt\n",$srcTags->{ XPComment },"\n\n";

  print "exiftool -DateTimeOriginal='$dt' -overwrite_original  -City=$city -Province-State=$state -Location=\"$location\" -Keywords=Houghton -ObjectName=\"$title\" -Caption-Abstract=\"",$srcTags->{ XPComment },"\" \"$_\"\n";

#   my $exifTool = new Image::ExifTool;
#   $exifTool->SetNewValue( 'Caption-Abstract',$sub );
#   $exifTool->SetNewValue( Keywords => 'Houghton', AddValue => 1 );
#   $exifTool->SetNewValue( 'DateTimeOriginal', $dt );
#   $exifTool->SetNewValue( 'City', $city );
#   $exifTool->SetNewValue( 'Province-State', $st );
#   if( $loc ) {
#     $exifTool->SetNewValue( 'Location', $loc );
#   }
#   if( $evt ) {
#     $exifTool->SetNewValue( 'Event', $evt );
#   }

#   my $dst_fn = "$dt.jpg";

#   my $src_fn = "../1950 Houghton Family/$fn.JPG";

#   $exifTool->WriteInfo( $src_fn, $dst_fn );
}


