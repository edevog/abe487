#!/bin/perl
#03-common-words.pl

use strict;
use warnings;
use autodie;
use feature "say";
use Data::Dumper;

unless (@ARGV == 2) {
    die "Please provide two files.\n";
}

my $first_txt = shift;
my $second_txt = shift;

open my $first_fh, '<', $first_txt;
open my $second_fh, '<', $second_txt;

my %file1;
while (my $line = <$first_fh>){
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words){
        $word =~ s/[^A-Za-z0-9]//g;
        $file1{lc($word)}=0;
    }
}
my %file2;
while (my $line = <$second_fh>){
    chomp $line;
    my @words = split /\s+/, $line;
    for my $word (@words){
        $word =~ s/[^A-Za-z0-9]//g;
        $file2{lc($word)}=0;
    }

}
my $common=0;
for my $word (sort keys %file1){
    if (exists $file2{$word}) {
        say "$word";
        $common++;
    }

}
say "Found $common words in common.";
#say Dumper(\%file1);
