#!/usr/bin/perl

use strict;
use warnings;

my $input_file = shift;

unless ( defined($input_file)){
    die "Please enter read file";

open my $input_fh,'<',$input_file or die "Coud not open '$input_file'$!";

while (my $line = <$input_fh>){
    chomp $line;
    foreach my $str (split /\s+/, $line) {
        $count{$str}++;
    }
}

foreach my $str (short keys %count) {
    printf "%-31s %s\n", $str, $count{$str};
}
