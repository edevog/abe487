#!/usr/bin/perl
#06-gc.pl
use warnings;
use strict;
use feature "say";

unless(@ARGV==2){
    die "Please provide 2 sequences.\n";
}
__END__
for my $seq (@ARGV){
    say "-------";
    say "Seq :$seq";
    my $length = length($seq);
    say "Length: $length";

    #in the brackets (anyting that matches those letters not necessarily in that 
    #order)the slashes define that a character class is occuring?

    my $gc= scalar( grep { /[GC]/ } split('', uc $seq));# character class  
    say "#GC : $gc";  
    my $pergc=$gc/$length*100;
    say "%GC : $pergc";
}

__END__
my @seq=qw(@ARGV);
my $seq =split(" ",$seq);
say "$seq";
say "Seq :@ARGV";

say "Length :", scalar(@ARGV);
