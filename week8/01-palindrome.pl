#!/usr/bin/perl
#01-palindrom.pl
use strict;
use warnings;
use autodie;
use feature "say";

unless (@ARGV){
    die "Please provide a word or phrase.\n";
}

my $input = lc(shift);
$input =~ s/[^A-Za-z0-9]//g;
my $rev_input = reverse $input;


if ("$input" eq "$rev_input"){
    say "Yes";
}else{
    say "No";
}
