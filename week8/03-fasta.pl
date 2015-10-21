#!/Usr/bin/perl
#03-fasta.pl

use warnings;
use strict;
use autodie;
use feature 'say';

unless (@ARGV){
    die "Please provide a FASTA file.\n";
}
my $header;

while (my $line = shift){
    chomp $line;
    if (substr($line,0,1) eq '>') {
        $header = $line;

say "$header";
    }
}
