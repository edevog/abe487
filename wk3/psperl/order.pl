#!/usr/bin/perl
#order.pl
use strict;
use warnings;

my $input1= shift @ARGV;
my $input2= shift @ARGV;

my @list= ("$input1","$input2");

my @sorted_words = sort {$a cmp $b} @list;

# print "@list\n";
# print "@sorted_words\n";

if ("@list" eq "@sorted_words"){
	print "right order\n";
}else{
	print "wrong order\n";
};