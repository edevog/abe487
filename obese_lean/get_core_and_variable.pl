#!/usr/bin/env perl

use strict;
use warnings;
use feature 'say';
use autodie;

my %kegg;
open my $core_fh, '>','core';
open my $variable_fh, '>', 'variable';

my $file_ct = @ARGV;
for my $file (@ARGV) {
    open my $fh, '<', $file;

    while(my $line = <$fh>) {
        chomp($line);
        my ($k, $ct) = split (',',$line);
        if ($ct >= 50) {
        $kegg{$k}++;
        }
    opel my $variable_fh, '`dd
    }
}

for my $k(keys %kegg) {
    if ($kegg{$k} == $file_ct) {
        say $core_fh $k;
    }
    else {
        say $variable_fh $k;
    }
}
