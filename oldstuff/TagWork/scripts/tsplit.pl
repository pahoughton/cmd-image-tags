my $origComment = "Multi Line
Comment for
Testing
Split function";

foreach my $ln (split( /\n/,$origComment)) {
  print "LN: $ln\n";
}
