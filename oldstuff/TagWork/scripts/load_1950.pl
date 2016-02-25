#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use DBI;
my $pdb = DBI->connect("dbi:mysql:pictures",'paul','mysql');

my $qsql = "select initials, fullname from initials_2_names";

my %InitialConv;
my $sth = $pdb->prepare( $qsql );
$sth->execute() || die( $qsql );
while( my( $t_in, $t_nm ) = $sth->fetchrow_array() ) {
  $InitialConv{ $t_in } = $t_nm;
}
$InitialConv{ "\\?\\?\\?" } = "Unknown";

my $seqnum = 0;
while( <> ) {
  chop;
  my ($i_fn,$i_dt, $i_sub, $i_loc, $i_info, $i_event )
    = split( "\t" );

  my $i_city;
  my $i_state;
  if( $i_loc ) {
    ($i_city, $i_state) = split( /, /, $i_loc );
    $i_city .= "\"";
    $i_state = "\"$i_state";
  } else {
    $i_city = "NULL";
    $i_state = "NULL";
  }

  if( $i_fn =~ /19.* (\d+)$/ ) {
    $seqnum = $1 * 100;
  } else {
    $seqnum += 100;
  }
  if( ! $i_info ) {
    $i_info = "NULL";
  }

  if( ! $i_sub ) {
    $i_sub = "NULL";
  }

  my $i_dt_val;
  if( $i_dt =~ /"/) {
    if( $i_dt =~ /191\?/ ) {
      $i_dt_val = "\"1910-01-01\"";
    } elsif( $i_dt =~ /192\?/ ) {
      $i_dt_val = "\"1920-01-01\"";
    } elsif( $i_dt =~ /193\?/ ) {
      $i_dt_val = "\"1930-01-01\"";
    } elsif( $i_dt =~ /194\?/ ) {
      $i_dt_val = "\"1940-01-01\"";
    } else {
      $i_dt_val = $i_dt;
    }
  } elsif( $i_dt =~ /^\d\d\d\d$/ ) {
    $i_dt_val = "\"$i_dt-01-01\"";
    $i_dt = "\"$i_dt\"";
  } else {
    if( ! $i_dt ) {
      $i_dt = "NULL";
    }
    $i_dt_val = "\"0000-00-00\"";
  }

  while( my( $k, $v ) = each( %InitialConv ) ) {
    $i_sub =~ s~$k~$v~;
  }

  $i_sub =~ s/\s+"/"/;

  if( ! $i_event ) {
    $i_event = "NULL";
  }
  print "$i_fn\t$i_dt\t$i_sub\t$i_city\t$i_state\t$i_info\n";

  my $sql = "insert into pic_info (
filename,
src_date,
src_subjects,
city,
state,
info,
event,
datetaken,
seqnum
) values (
$i_fn,
$i_dt,
$i_sub,
$i_city,
$i_state,
$i_info,
$i_event,
$i_dt_val,
$seqnum
)";
  $pdb->do( $sql ) || die( $sql );
}

