#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;

my $doSet=1;

foreach my $fn (@ARGV) {
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($fn);


  if( $fn =~ /100_(\d\d\d\d).jpg/ ) {
    my $fnSeq=$1;
    my $dateTime=sprintf( "2006-03-16 01:%02d:%02d",
			  $fnSeq / 60,
			  $fnSeq % 60 );
    my $fnDateTime=sprintf( "2006-03-16 01%02d%02d",
			  $fnSeq / 60,
			  $fnSeq % 60 );
    my $objName="Rob's Europe Trip";
    my $abstract=$objName;
    my $destFn="../Work/Test/$fnDateTime $objName.jpg";

    if( $doSet ) {
      $srcExif->SetNewValue( 'DateTimeOriginal', $dateTime );
      $srcExif->SetNewValue( Keywords => 'Houghton', AddValue => 1 );
      $srcExif->SetNewValue( 'ObjectName',$objName );
      $srcExif->SetNewValue( 'Caption-Abstract', $abstract );
      $srcExif->WriteInfo( $fn, $destFn );
    }
  }
}



