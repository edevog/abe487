#!/usr/bin/perl
#extracredit.pl
use strict;
use warnings;
use autodie;

my $input = shift;
my $output = 'extracredit.txt';

if (!defined($input)){
  die "Provide input file name.\n";
};                                                                                                                                               
               
open (my $in_fh, "<", $input); 
open (my $out_fh, ">", $output);                                      
         

while (my $number = <$in_fh>){
  chomp $number;

  if ($number % 2 ==0 || $number < 25){
    print $number, "\n";
  }
  
  else{
    my $factorial = 1;                                             
                                                                                                   
    while ($number > 0){
      $factorial = $factorial * $number;
      $number--;
    }
  print $out_fh $factorial, "\n";
  }
}
close $in_fh;                                                                                                    
close $out_fh;