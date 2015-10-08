#!/usr/bin/perl
#01-mod.pl
use warnings;
use strict;

unless(@ARGV){
    die "Please provide a list of numbers.\n";
}
my @evens;
foreach my $input (@ARGV){
    if($input % 2 ==0){
        push (@evens,$input);
    }
}

print ("evens = ", join(", ",@evens), "\n");
