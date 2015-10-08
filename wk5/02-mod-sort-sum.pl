#!/usr/bin/perl
#02-mod-sort-sum.pl
use warnings;
use strict;
use feature 'say';

unless(@ARGV){
    die "Please provide a list of numbers.\n";
}
my ($evensum, $oddsum) = (0,0);

foreach my $input (@ARGV){
    if($input % 2 ==0){
        $evensum+=$input;
    }
    else {
        $oddsum+=$input;
    }
}

say "sum evens = $evensum \n";
say "sum odds = $oddsum \n";
