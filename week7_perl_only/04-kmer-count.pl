#!/bin/perl
#04-kmer-count.pl
#
use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;

my $seq      = shift or die "Please provide a sequence.\n";
my $mersize  = shift || 3;

if (-e $seq) {
    open my $fh, '<', $seq;
    $seq = join '', <$fh>;
}

my $seqlen = length($seq);

unless ($seqlen) {
    die "Zero-length sequence.\n";
}

my $numkmers = $seqlen - $mersize + 1;

if ($numkmers < 1){
    die "Cannot get any $mersize mers from a sequence of length $seqlen\n"
}

my $fmt = "%-15s %10s\n";
printf $fmt, "Sequence length", $seqlen;
printf $fmt, "Mer size", $mersize;
printf $fmt, "Number of kmers", $numkmers;

my %kmers;

for (my $i=0; $i < $numkmers; $i++){
    my $kmer = uc substr($seq, $i, $mersize);
    $kmers{$kmer}++;
}

my $unique_kmer = scalar(keys %kmers);

printf $fmt, "Unique kmers", $unique_kmer;

my $nsingle = scalar(grep { $_ == 1 } values %kmers);
printf $fmt, "Num. singletons", $nsingle;

exit if $nsingle == $numkmers;

say "Most abundant";
my $i;
for my $key (
    sort { $kmers{$b} <=> $kmers{$a} || $a cmp $b }
    keys %kmers
) {
    my $count = $kmers{$key};
    last if $count == 1;
    $i++;
    say $key, ": ", $kmers{$key};
    last if $i == 10;
}
