#!/usr/bin/perl
#percent.pl
use strict;
use warnings;

my $i = shift; 
my $j = shift;

if ($i+$j==0) {
	print("Watch yourself, son.\n");
}else{
	printf("%.2f%%\n\n", $i/($i+$j)*100);
};
