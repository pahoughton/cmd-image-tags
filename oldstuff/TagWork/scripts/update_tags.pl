#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use DBI;
use Image::ExifTool;

my $pdb = DBI->connect("dbi:mysql:pictures",'paul','mysql');

my $sql = "select filename, src_subjects, city, state, datetaken, info, event from pic_info";

my $sth = $pdb->prepare( $sql );
$sth->execute() || die( $sql );
while( my ($fn, $sub, $city, $st, $dt, $loc, $evt ) = $sth->fetchrow_array() ) {

  my $exifTool = new Image::ExifTool;
  $exifTool->SetNewValue( 'Caption-Abstract',$sub );
  $exifTool->SetNewValue( Keywords => 'Houghton', AddValue => 1 );
  $exifTool->SetNewValue( 'DateTimeOriginal', $dt );
  $exifTool->SetNewValue( 'City', $city );
  $exifTool->SetNewValue( 'Province-State', $st );
  if( $loc ) {
    $exifTool->SetNewValue( 'Location', $loc );
  }
  if( $evt ) {
    $exifTool->SetNewValue( 'Event', $evt );
  }

  my $dst_fn = "$dt.jpg";

  my $src_fn = "../1950 Houghton Family/$fn.JPG";

  $exifTool->WriteInfo( $src_fn, $dst_fn );
}


