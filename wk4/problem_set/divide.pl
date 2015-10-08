#!/usr/bin/perl
#divide.pl
use strict;
use warnings;
use autodie;

if (@ARGV !=2){
	die "Please input 2 numbers\n";
};


my $numerator = shift @ARGV;
my $denominator = shift @ARGV;

if ($numerator<0 || $denominator<0){
		print STDERR "No negative numbers.\n";
}elsif ($denominator==0){
		print STDERR "You broke all math.\n";
}else{
	print $numerator/$denominator, "\n";
};
