#!/usr/bin/perl
#counting.pl
use strict;
use warnings;
use autodie;

my $input = shift;
open my $input_fh, "<", $input or die "Can't read $input: $!\n";


my $line_count = 0;
my $total_length = 0;

while (my $line =<$input_fh>){
      chomp $line;
      $line_count++;
      my $length = length ($line);
      my $total_length = $total_length += $length;
    }

my $avg_length = $total_length/$line_count;

print "Total number of lines =", $line_count, "\n";
print "Total length = ", $total_length, "\n";
print "Average line length= ", $avg_length, "\n"