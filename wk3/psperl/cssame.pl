#!/usr/bin/perl
#cssame.pl
use strict;
use warnings;

print "Enter string 1:";
my $input1 = <>;

print "Enter string 2:";
my $input2 = <>;

if (lc("$input1") eq lc("$input2")){
	print "Same\n";
	}else{
		print "Different\n";
	};