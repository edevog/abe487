#!/usr/bin/perl
#03-sort.pl
use warnings;
use strict;

unless(@ARGV){
    die "Please provide a list of numbers.\n";
}

my @defaultsort=sort (@ARGV);
my @numsort=sort ({$a<=> $b} @ARGV);
my @revsort=sort({$b <=> $a} @ARGV);

print "default sort = ", join(", ", @defaultsort), "\n";

print "numerical sort = ", join(", ", @numsort), "\n";

print "reverse numerical sort = ", join(", ", @revsort), "\n";

