#!usr/bin/perl
#04-restriction.pl

use warnings;
use strict;
use feature 'say';
use autodie;

#R is A or G
#Y is C or T
#we want to math R^AATTY

my $file = shift || die "Please provide and sequence or file.\n";

open my $fh, '<', $file;


(my $string = join '', <$fh>) =~ s/\s//g;

#my $string = '';
#while (my $line = <$fh>){
#    chomp $line;
#    $string .= $line;
#}

$string =~ s/([AG])(AATT[CT])/$1^$2/g;

say $string;
