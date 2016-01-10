#!/usr/bin/perl
# 2015-12-22 (cc) <paul4hough@gmail.com>
#

eval 'exec perl -w -S $0 ${1+"$@"}'
    if 0 ;

use warnings;
use strict;
use Data::Dumper;
use File::Find;
use File::Basename;
use Image::ExifTool qw(:Public);
use Digest::MD5::File qw(dir_md5_hex file_md5_hex url_md5_hex);

our @cmtFlds = ('Comment', 'ObjectName', 'XPComment', 'Caption-Abstract');
our @dtFlds = ('DateTimeOriginal','CreateDate');
our @extlist = ('JPG','PNG','MOV','AVI','AEE');

our $md5;
our $dtfiles;
our $destdir = "/srv/00-work/image/00-picyears";

sub found {
  if( !  -f  ) {
    return;
  }
  $md5->{$File::Find::name} = file_md5_hex($_);
  my $destfn;
  my $meta;
  if( /jpg$/i || /.png$/i || /m4v$/i ) {
    $meta = ImageInfo($_);
    my $dtstamp;
    foreach my $df (@dtFlds) {
      if( defined( $meta->{$df} ) ) {
	$dtstamp = $meta->{$df};
	last;
      }
    }
    if( ! defined($dtstamp) ) {
      $destfn = "$destdir/1990/$_";
      #print "$_\n  ",join("\n  ",sort(keys(%$meta))),"\n";
    } else {
      my $odtstamp = $dtstamp;

      $dtstamp =~ s/(\d+):(\d+):(\d+) (\d+):(\d+):(\d+)/$1-$2-$3.$4$5$6/;
      $odtstamp =~ s/(\d+):(\d+):(\d+) (\d+):(\d+):(\d+)/$1-$2-$3 $4$5$6/;

      my $dfn;
      if( /^$dtstamp/ ) {
	#print "rstamp: $_\n";
	$dfn = $_;
	substr($dfn,0,length($odtstamp)) = $dtstamp;
      } else {
	$dfn = "$dtstamp-".basename($_);
      }
      if( defined( $dtfiles->{$dtstamp} ) ) {
	foreach my $dtfn (@{$dtfiles->{$dtstamp}}) {
	  my $afn = basename($_);
	  my $amd5 = $md5->{$File::Find::name};
	  my $dfn = basename($dtfn);
	  my $dmd5 = $md5->{$dtfn};
	  if( $dmd5 eq $amd5 ) {
	    print "DUP:\n  $afn\n  $dfn\n\n";
	    unlink($_) || die("unlink $_");
	    return;
	  } else {
	    #print "DIF:\n  $afn\n  $dfn\n\n";
	  }
	}
	push(@{$dtfiles->{$dtstamp}},$File::Find::name);
      } else {
	my @flst = ($File::Find::name);
	$dtfiles->{$dtstamp} = \@flst;
      }

      my $ddir = dirname($_);
      if( defined($ddir) && $ddir ne "." ) {
	die "$ddir";
      }

      my $pyr = substr($dtstamp,0,4);

      $destfn = "$destdir/$pyr/$dfn";
      #if( -f "../photo_exp/$dfn" ) {
      #  die("Exists ../photo_exp/$dfn");
      #}
      #rename($_,"../photo_exp/$dfn") || die("rename $_ ../photo_exp/$dfn");
      foreach my $cf (@cmtFlds) {
	if( defined($meta->{$cf}) ) {
	  #printf "  %s: %s\n",$cf,$meta->{$cf};
	}
      }
    }
  } else {
    $destfn = "$destdir/1990/$_";
  }
  if( ! defined( $destfn ) ) {
    die($_);
  }
  my $lwrExt = $destfn;
  $lwrExt =~ s~.*\.([^.]+)$~$1~;
  $lwrExt =~ y/A-Z/a-z/;
  substr($destfn,-1 * length($lwrExt)) = $lwrExt;
  if( -f "$destfn" ) {
    my $dmd5 = file_md5_hex($destfn);
    my $amd5 = $md5->{$File::Find::name};
    if( $amd5 ne $dmd5 ) {
      # print "DIF: $destfn\n";
      if( defined( $meta ) ) {
	my $hmeta = ImageInfo($destfn);
	if( defined( $meta->{Software} ) && $meta->{Software} !~ /^Photos/ ) {
	  print "dmv: $destfn\n";
	  #rename($_,$destfn) || die("mv '$_' '$destfn' - $!");
	} else {
	  print "drm: $destfn\n";
	  #unlink($_);
	}
	if( 0 ) {
	  foreach my $k (keys(%$meta)) {
	    if( ! defined( $hmeta->{$k} ) ) {
	      print "  MKY: $k\n";
	    }
	  }
	  foreach my $k (keys(%$hmeta)) {
	    if( ! defined( $meta->{$k} ) ) {
	      print "  HKY: $k\n";
	    } elsif ($hmeta->{$k} ne $meta->{$k}) {
	      print "  DKY: $k\n";
	    }
	  }
	}
      } else {
	print "dxx: $destfn\n";
	unlink($_);
      }
    } else {
      print "DUP: $destfn\n";
      unlink($_);
    }
  } else {
    print "new: $destfn\n";
    rename($_,$destfn) || die("mv '$_' '$destfn' - $!");
  }
}

foreach my $fn (@ARGV) {
  find(\&found,$fn);
}


#use Carp;
#use DBI;
#use DBD::Pg qw(:pg_types);
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
