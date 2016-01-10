#!/usr/bin/perl
# 2015-12-23 (cc) <paul4hough@gmail.com>
#

eval 'exec perl -w -S $0 ${1+"$@"}'
    if 0 ;

use warnings;
use strict;
use Carp;

use Image::ExifTool qw(:Public);

our @dtFlds = ('DateTimeOriginal','CreateDate');

foreach my $fn (@ARGV) {
  my $destfn;
  #2015-01-19.143928-IMG_2292.jpg
  if( $fn =~ /(\d\d\d\d)-(\d\d)-(\d\d).(\d\d)(\d\d)(\d\d)(.*)/ ) {
    my ($yr,$mt,$dt,$hr,$mn,$sc,$rest) = ($1,$2,$3,$4,$5,$6,$7);
    my $fnstamp = "$yr-$mt-$dt.$hr$mn$sc";

    my $meta = ImageInfo($fn);
    my $fdc;
    my $fyr;
    my $fdate;
    foreach my $k (sort(keys(%$meta))) {
      foreach my $df (@dtFlds) {
	if( defined( $meta->{$df} )
	    && $meta->{$df} =~ /(\d+)(\d):(\d+):(\d+) (\d+):(\d+):(\d+)/ ) {
	  my ($dec,$dyr,$mo,$dt,$hr,$mn,$sc) = ($1,$2,$3,$4,$5,$6,$7);
	  $fdc = $dec."0";
	  $fyr = "$dec$dyr";
	  $fdate = "$fyr-$mo-$dt.$hr$mn$sc";
	}
      }
    }
    $rest =~ s~^-~~;
    if( ! defined( $fdate ) || $fdate =~ /^0/ ) {
      if( $hr > 23 ) {
	$hr = $hr % 24;
      }
      if( $mn > 60 ) {
	$mn = $mn % 60;
      }
      if( $sc > 60 ) {
	$sc = $sc % 60;
      }

      my $pstamp = "$yr-$mt-$dt $hr:$mn:$sc";
      my $fstamp = "$yr-$mt-$dt.$hr$mn$sc";
      my $nfn = "$fstamp-$rest";

      print "exiftool '$fn' -overwrite_original  -ModifyDate='$pstamp' -DateTimeOriginal='$pstamp' -CreateDate='$pstamp'\n";
      die("no fdate $fn");
    }
    $rest =~ s~\s+~-~g;
    $rest =~ y/A-Z/a-z/;
    $destfn = "$fdate-$rest";

  } else {
    die("name $fn");
  }


  if( defined( $destfn ) && $destfn ne $fn ) {
    if( -f $destfn ) {
      die("exist $destfn");
    } else {
      print "rn $fn $destfn\n";
      rename($fn,$destfn) || die("rn $destfn - $!");
    }
  } else {
    if( ! defined( $destfn ) ) {
      die("no destfn $fn");
    }
  }
}

#use DBI;
#use DBD::Pg qw(:pg_types);
#use File::Basename;
#use File::Find;
#use MP4::File;
#use Meta::TMDb;
#use Meta::IMDB;
#use Term::ReadLine;
#use Data::Dumper;
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
