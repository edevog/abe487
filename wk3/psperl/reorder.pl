#!/usr/bin/perl
#reorder.pl
use strict;
use warnings;

my $input1= shift @ARGV;
my $input2= shift @ARGV;

my @list= ("$input1","$input2");

my @sorted_words = sort {$a cmp $b} @list;

print "@sorted_words\n";