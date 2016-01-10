#!/usr/bin/perl
# 2015-12-22 (cc) <paul4hough@gmail.com>
#

eval 'exec perl -w -S $0 ${1+"$@"}'
    if 0 ;

use warnings;
use strict;
use File::Find;
use Digest::MD5::File qw(dir_md5_hex file_md5_hex url_md5_hex);
use Image::ExifTool qw(:Public);

my ($adir,$bdir) = @ARGV;

my @dirSufs1980 = (
  " Patricia Ann Morris",
  " Paul A Houghton",
  " Houghton",
  " Houghton Family",
  " John & Joan's Honeymoon",
  " John & Joan's Wedding",
  " John & Joan's Wedding Shower",
  " Scotty Colquhoun",
  "-Rob",
  "-Ed Houghton",
  "-Mark-Popjoy",
    );

sub bfile {
  if( -f ) {
    if( /^(\d\d\d\d)(-\d\d-\d\d \d\d\d\d\d\d) /) {
      my $yr = $1;
      my $decade;
      my $yrdir = $yr;
      if( $yr =~ /19[12]\d/ ) {
	$decade = 1920;
	$yrdir = '1920 Houghton Family';
      } else {
	$decade = substr($yr,0,3)."0";
	if( ! -f "$adir/$decade/$yrdir/$_" ) {
	  my $found = 0;
	  if( $decade eq "1960" ) {
	    $yrdir = $decade;
	  }
	  foreach my $ds (@dirSufs1980) {
	    if( -f "$adir/$decade/$yrdir$ds/$_" ) {
	      $found = 1;
	      $yrdir = "$yrdir$ds";
	      last;
	    } elsif ( -f "$adir/$decade/$decade$ds/$_" ) {
	      $found = 1;
	      $yrdir = "$decade$ds";
	      last;
	    }
	  }
	  if( ! $found ) {
	    print("mis $decade/$yrdir/$_\n");
	  }
	}
      }
      my $afn = "$adir/$decade/$yrdir/$_";
      if( -f $afn ) {
	if( file_md5_hex($_) eq file_md5_hex($afn) ) {
	  print "dup $File::Find::name\n";
	  unlink($_) || die("unlink $_");
	} else {
	  print "dif $_\n";
	  unlink($_) || die("unlink $_");
	  if( 0 ) {
	  my $meta = ImageInfo($_);
	  my $hmeta = ImageInfo($afn);
	  foreach my $k (sort(keys(%$meta))) {
	    if( ! defined( $hmeta->{$k} ) ) {
	      #print "  MKY: $k\n";
	    }
	  }
	  foreach my $k (sort(keys(%$hmeta))) {
	    if( ! defined( $meta->{$k} ) ) {
	      #print "  HKY: $k\n";
	    } elsif ($hmeta->{$k} ne $meta->{$k}) {
	      #print "  DKY: $k\n";
	    }
	  }
	  }
	}
      }
    }
  }
}

print "$adir\n$bdir\n";
find(\&bfile,$bdir);

#use Carp;


#use DBI;
#use DBD::Pg qw(:pg_types);
#use File::Basename;
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
