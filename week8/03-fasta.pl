#!/Usr/bin/perl
#03-fasta.pl

use warnings;
use strict;
use autodie;
use feature 'say';

my $input = shift || die "Please provide a FASTA file.\n";

open my $fh, '<', $input;

my $count;
while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /^>(.+)/) {
        $count++;
        say "$count: $1";
    }
}
