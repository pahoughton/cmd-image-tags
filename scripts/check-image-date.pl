#!/usr/bin/perl
# 2016-01-27 (cc) <paul4hough@gmail.com>
#

eval 'exec perl -w -S $0 ${1+"$@"}'
    if 0 ;

use warnings;
use strict;
use Carp;
use Image::ExifTool qw(:Public);

our @dtFlds = ('DateTimeOriginal','CreateDate');

foreach my $fn (@ARGV) {
  my $meta = ImageInfo($fn);

  if( $fn =~ /(\d\d\d\d)-(\d\d)-(\d\d).(\d\d)(\d\d)(\d\d)(.*)/ ) {
    my ($yr,$mt,$dt,$hr,$mn,$sc,$rest) = ($1,$2,$3,$4,$5,$6,$7);
    my $fnstamp = "$yr:$mt:$dt $hr:$mn:$sc";

    my $dto = $meta->{DateTimeOriginal} ? $meta->{DateTimeOriginal} : '';
    my $cdt = $meta->{CreateDate} ? $meta->{CreateDate} : '';
    if( ! defined( $meta->{DateTimeOriginal} )
	|| ! defined( $meta->{CreateDate} )
	|| $dto ne $cdt ) {
      print "$dto != $cdt $fn\n";
    } elsif ($dto ne $fnstamp ) {
      die( "dto($dto) ne fn($fnstamp)");
    }
  } else {
    die("fn format: $fn");
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
