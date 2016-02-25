#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use DBI;
my $pdb = DBI->connect("dbi:mysql:pictures",'paul','mysql');

while( <> ) {
  my ($i_rel,$i_in, $i_nm, $i_desc, $i_dob )
    = split( "\t" );
  #$i_in =~ s/"([^"]+)"/$1/;
  #$i_nm =~ s/"([^"]+)"/$1/;
  #$i_desc =~ s/"([^"]+)"/$1/;
  #$i_dob =~ s/"([^"]+)"/$1/;

  if( ! $i_desc ) {
    $i_desc = "NULL";
  }
  if( ! $i_dob ) {
    $i_dob = "NULL";
  }
  print "$i_in\t$i_nm\t$i_desc\t$i_dob\n";

  my $sql = "insert into initials_2_names (
initials,
fullname,
info,
dob_str
) values (
$i_in,
$i_nm,
$i_desc,
$i_dob
)";
  $pdb->do( $sql ) || die( $sql );
}

