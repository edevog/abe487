#!/usr/bin/perl
#findnobody.pl
use strict;
use warnings;
use autodie;

while (my $line = <>) {
    chomp($line);
    
    $line = uc $line;
    my $nobody   = index($line,'Nobody');
    my $somebody = index($line,'SOMEBODY');
    if ($nobody >= 0) {
    warn("I found nobody at $nobody.\n");
    }
    if ($somebody >= 0) {
    warn("I found somebody at $somebody.\n");
    }
}
