#!/usr/bin/perl -w

eval 'exec /usr/bin/perl -w -S $0 ${1+"$@"}'
    if 0; # not running under some shell

use strict;

use Image::ExifTool;

while( <> ) {
  chop;
  my $srcExif = new Image::ExifTool;
  my $srcTags = $srcExif->ImageInfo($_);

  while( my($k,$v) = each( %$srcTags ) ) {
    print "$k:'$v'\n";
  }
}
