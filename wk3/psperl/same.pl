#!/usr/bin/perl
#same.pl
use strict;
use warnings;

print "Enter string 1:";
my $input1 = <>;

print "Enter string 2:";
my $input2 = <>;

if ("$input1" eq "$input2"){
	print "Same\n";
	}else{
		print "Different\n";
	};
