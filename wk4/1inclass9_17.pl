#!/usr/bin/perl
#1inclass9-17

use strict;
use warnings;
use autodie; #not sure what it does, USE WHEN INTERACTING WITH FILES

my $n = shift @ARGV; #@ARGV processes commandline arguments


if (defined $n){
	print "$n is defined";
}elsif{
	print "please enter a number";
};

print $n + $n, "\n";




