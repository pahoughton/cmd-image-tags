#!/usr/bin/perl
# 2016-02-29 (cc) <paul4hough@gmail.com>
#

eval 'exec perl -w -S $0 ${1+"$@"}'
    if 0 ;

use warnings;
use strict;
use Data::Dumper;
use Geo::Gpx;
use Image::ExifTool;
use DateTime::Format::Strptime;

my $waypts;

my $wpcnt = 0;
foreach my $fn (glob('"/home/paul/Dropbox/Apps/Moves Export/storylines_201512*gpx"')) {

  open( my $gfh, "<", $fn ) || die("$? - open $fn");
  my $gpx = Geo::Gpx->new( input => $gfh );

  my $piter = $gpx->iterate_points();
  while( my $pt = $piter->() ) {
    if( defined( $waypts->{$pt->{time}} ) ) {
      my $dpt = $waypts->{$pt->{time}};
      if( $dpt->{lon} ne $pt->{lon}
	  || $dpt->{lat} ne $pt->{lat} ) {
	print "# dup $wpcnt $pt->{time} $pt->{lat} $dpt->{lat} $pt->{lon} $dpt->{lon}\n";
      }
    } else {
      ++ $wpcnt;
    }
    $waypts->{$pt->{time}} = $pt;
  }
  printf("# %6d $fn\n",$wpcnt);
}

print "# Processed $wpcnt points\n";

my @wayptslist = sort(keys(%$waypts));

foreach my $fn (@ARGV) {
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($fn);
  my $dtstr;
  my $dtsrc;

  if( defined( $srcTags->{GPSPosition} ) ) {
    print "# GPS $fn\n";
    next;
  }

  if( defined( $srcTags->{ 'DateTimeOriginal' } ) ) {
    $dtstr = $srcTags->{ 'DateTimeOriginal' };
    $dtsrc = 'dto';
  } elsif( defined( $srcTags->{'CreateDate'} ) ) {
    $dtstr = $srcTags->{ 'CreateDate' };
    $dtsrc = 'cdt';
  } else {
    #print "ndt $fn\n";
    print "# NODT $fn\n";
    next;
  }


  my $dtparser = DateTime::Format::Strptime->new(
    pattern => '%Y:%m:%d %T %Z',
    on_error => 'croak',
      );

  my $dt = $dtparser->parse_datetime("$dtstr MST");

  my $prevdt = 0;
  my $nextdt = 0;
  foreach my $wdt (@wayptslist) {
    #print "DT:".$dt->epoch()." != $wdt\n";
    if( $dt->epoch() < $wdt ) {
      $nextdt = DateTime->from_epoch( epoch => $wdt );
      last;
    }
    $prevdt = DateTime->from_epoch( epoch => $wdt );
  }
  my $picwpt;
  {
    my $pdiff = $dt->epoch() - $prevdt->epoch();
    my $ndiff = $nextdt->epoch() - $dt->epoch();
    if( $pdiff < $ndiff ) {
      $picwpt = $waypts->{$prevdt->epoch()};
    } else {
      $picwpt = $waypts->{$nextdt->epoch()};
    }
  }
  my $plat = $picwpt->{lat};
  my $plon = $picwpt->{lon};
  my $ptm = $picwpt->{time};

  print "# $fn\n#   $plat,$plon $ptm
exiftool -overwrite_original \\
	 -Keywords=Houghton \\
	 -GPSLatitudeRef=N -GPSLongitudeRef=W \\
	 -GPSLatitude='$plat' \\
	 -GPSLongitude='$plon' \\
	 '$fn'

";

}


#use DBI;
#use DBD::Pg qw(:pg_types);
#use File::Basename;
#use File::Find;
#use MP4::File;
#use Meta::TMDb;
#use Meta::IMDB;
#use Term::ReadLine;
#use POSIX;
#use Text::CSV;
#use DVD::Read;
#use Encode;
#use LWP;
#use MP4::Info;
#use XML::Parser;
#use Imager;

#my $dbh = DBI->connect('dsn','user','pass',
#                       { RaiseError => 1, AutoCommit => 0 } );
#

## Local Variables:
## mode:perl
## end:
