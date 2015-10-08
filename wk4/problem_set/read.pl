#!/usr/bin/perl
#read.pl
use strict;
use warnings;
use autodie;

my $input = shift @ARGV;
my $output = 'screaming.txt';

open (my $input_fh, '<', $input) ;

open (my $output_fh, '>', $output);

while(my $line = <$input_fh>){
	print $output_fh uc($line), "\n";
}
