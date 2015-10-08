#!/usr/bin/perl
#01-mod.pl
use warnings;
use strict;
use feature "say";

unless(@ARGV){
    die "Please provide a list of sequences.\n";

}

say "sorted = ", join(", ", sort {length($a)<=> length($b)} (@ARGV));

say "reverse = ", join(", ", sort ({length($b) <=> length($a)} @ARGV));
