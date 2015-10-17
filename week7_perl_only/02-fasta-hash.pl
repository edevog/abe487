#!/bin/perl
#02-fasta-hash.pl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my $file = shift || 'Perl_V.genesAndSeq.txt';

open my $fasta_fh, '<', $file;
my %seq;

my $header;
while (my $line = <$fasta_fh>){
    chomp $line;
    if (substr($line,0,1) eq '>') {
        $header=substr($line,1);
        $seq{$header}=0;
    }
    else {
        $seq{$header}+=length($line);
}
}

foreach my $id (sort {$seq{$a} <=> $seq{$b} } keys %seq){
    say "$id: $seq{$id}";
}
  