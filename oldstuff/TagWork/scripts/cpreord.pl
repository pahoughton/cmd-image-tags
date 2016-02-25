#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use DBI;
my $pdb = DBI->connect("dbi:mysql:pictures",'paul','mysql');

my $sql = "select filename, date( datetaken ), seqnum, src_subjects  from pic_info";

my $sth = $pdb->prepare( $sql );
$sth->execute() || die( $sql );
while( my( $fn, $dt, $sq, $sub ) = $sth->fetchrow_array() ) {
  my $dfn = sprintf( "$dt %04d $fn.jpg", $sq );
  $fn = "$fn.JPG";
  if( $fn =~ / \d.JPG/ ) {
    $fn =~ s~ (\d).JPG$~ 0$1.JPG~;
  }
  rename( $fn, $dfn ) || die "ren '$fn' $!";
  print "exiftool -Caption-Abstract=\"$sub\" \"$dfn\"\n";
}
