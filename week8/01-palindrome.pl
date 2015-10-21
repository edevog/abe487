#!/usr/bin/perl
#01-palindrom.pl
use strict;
use warnings;
use autodie;
use feature "say";
use Data::Dumper;

unless (@ARGV){
    die "Please provide a word or phrase.\n";
}

my $input = lc(shift);
$input =~ s/[..., ]//g;
my $rev_input = reverse $input;


if ("$input" eq "$rev_input"){
    say "Yes";
}else{
    say "No";
}
