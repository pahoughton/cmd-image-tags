#!/usr/bin/perl
# 2015-12-24 (cc) <paul4hough@gmail.com>
#

eval 'exec perl -w -S $0 ${1+"$@"}'
    if 0 ;

use warnings;
use strict;
use Carp;

use Image::ExifTool qw(:Public);

foreach my $fn (@ARGV) {
    my $meta = ImageInfo($fn);
    if( ! defined( $meta->{GPSPosition} ) ) {
      print "NGPS: $fn\n";
    } else {
      print "yes: $fn\n";
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
