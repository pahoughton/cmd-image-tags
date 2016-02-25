eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;

my $doSet = 0;
my $prevTime = 0;
my $prevDate = undef;
my $prevSeq = 0;

foreach my $fn (@ARGV) {
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($fn);

  my $origComment=undef;
  my $origDateTime=undef;
  my $origObjName=undef;
  my $fnDateTime=undef;
  my $objName="";
  my $abstract="";
  my $fnames=undef;
  my $fnSeq=undef;
  my $origFnDate=undef;
  if( $fn =~ /(\d\d\d\d-\d\d-\d\d) (\d\d\d\d) (.*).jpg/ ) {
    $origFnDate=$1;
    $fnSeq=$2;
    $origObjName=$3;
    $objName=$origObjName;
    $objName =~ s/Heather Haynes/Heather Izzett/;
    $objName =~ s/Eian Haynes/Ian Izzett/;
    $objName =~ s/Eian/Ian/;
    $objName =~ s/Longwater Gulch/Long Water Gulch/;
  } else {
    print "ERRORR: FN Format: $fn\n";
    exit 1;
  }

  my ($fYr,$fMon,$fDay) = split(/-/,$origFnDate);

  if( defined( $srcTags->{ DateTimeOriginal } )
    && $srcTags->{ DateTimeOriginal } ne "0000:00:00 00:00:00" ) {
    my ($oDate,$oTime) = split(/ /,$srcTags->{ DateTimeOriginal });
    my ($oYr,$oMon,$oDay) = split( /:/,$oDate);
    my ($oHr,$oMin,$oSec) = split( /:/,$oTime);

    if( $fYr != $oYr || $fMon != $oMon || $fDay != $oDay ) {
      print( "ERROR: Date mismatch: $fn\n",
	     "  $origFnDate != ",$srcTags->{ DateTimeOriginal },"\n" );
      exit 1;
    }
    $origDateTime = $srcTags->{ DateTimeOriginal };
    $fnDateTime = $origDateTime;
    $fnDateTime =~ s/(\d\d\d\d):(\d\d):(\d\d) (\d\d):(\d\d):(\d\d)/$1-$2-$3 $4$5$6/;
    $prevTime = ($oHr * 60 * 60) + ($oMin * 60) + $oSec;
    $prevSeq = $fnSeq;

    my $fnTime = sprintf( "%02d%02d%02d",
			  $prevTime / (60*60),
			  ($prevTime % (60*60)) / 60,
			  ($prevTime % 60) );
    #print "Test fnTime: $fnDateTime $fnTime\n";
  } else {
    my $fnTime = undef;
    $prevTime += $fnSeq;

    $fnDateTime = sprintf( "$origFnDate %02d%02d%02d",
			   $prevTime / (60*60),
			   ($prevTime % (60*60)) / 60,
			   ($prevTime % 60) );
    $origDateTime = sprintf( "$origFnDate %02d:%02d:%02d",
			     $prevTime / (60*60),
			     ($prevTime % (60*60)) / 60,
			     ($prevTime % 60) );
    if( $doSet ) {
      $srcExif->SetNewValue( 'DateTimeOriginal', $origDateTime );
    }
  }
  print "$fnDateTime $origDateTime\n";

}
