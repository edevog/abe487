#!/usr/bin/perl
#complement.pl
use strict;
use warnings;
use autodie;

my $infasta  = shift;
my $outfasta = shift;
if (! defined($infasta) or ! defined($outfasta)) {
    die "Please enter read file and output file name\n";
} else {
    open(my $infast_fh, '<', $infasta) or die "Cannot open $infasta: $!\n";
    open(my $outfast_fh,'>',$outfasta) or die "Cannot open $outfasta: $!\n";
    my $header;
    my $sequence = '';
    while (my $line = <$infast_fh>) {
    chomp($line);
    
    if ($line =~ /^>/) {
       
       	      if (length($sequence) > 0) {
	      
	       print($outfast_fh $header," reverse-complement\n",$sequence,"\n");
	       $sequence = '';
	       }
		$header = $line; 
		} else {
		
		$line =~ tr/atcgATCG/tagcTAGC/;
		$sequence = reverse($line).$sequence;
		}
    }
    if (length($sequence) > 0) {
    
      print($outfast_fh $header," reverse-complement\n",$sequence,"\n");
    }
    close($outfast_fh);
    close($infast_fh);
}