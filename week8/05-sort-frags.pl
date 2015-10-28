#!/usr/bin/perl
#05-sort-frags.pl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper qw(Dumper);

my $in = join '', <>;

say join "\n", sort { length($a) <=> length($b) } split /\^/, $in;


