#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use DBI;
my $pdb = DBI->connect("dbi:mysql:pictures",'paul','mysql');

my $sql = "select filename, date( datetaken ), seqnum from pic_info order by datetaken, seqnum";

my $sth = $pdb->prepare( $sql );
$sth->execute() || die( $sql );
our @Updates;
my $prev_dt = "";
my $hour = 1;
while( my( $fn, $dt, $sq ) = $sth->fetchrow_array() ) {
  if( $dt eq $prev_dt ) {
    ++ $hour;
  } else {
    $hour = 1;
    $prev_dt = $dt;
  }

  my $ndt = sprintf( "$dt %02d:00:00", $hour );
  printf "$dt %04d $ndt\n", $sq;
  my $usql = "update pic_info set datetaken = \"$ndt\" where filename = \"$fn\"";
  push( @Updates, $usql );
}

foreach my $updt (@Updates) {
  $pdb->do( $updt ) || die( $updt );
}
