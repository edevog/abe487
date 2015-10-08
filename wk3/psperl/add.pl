#!/usr/bin/perl

use strict;
use warnings;
#When a Perl script is run, its command-line arguments (if any) are stored in an automatic array called @ARGV. 
my $input1 = shift; #shift - shift a value off the beginning of an array
my $input2 = shift;

$input1>0 and $input2>0 or die "Your negativity is not appreciated. Please input 2 positive numbers.\n";

if (defined($input2)){
	print $input1 + $input2, "\n";
}
else {
	print "Please input 2 numbers \n";
}
