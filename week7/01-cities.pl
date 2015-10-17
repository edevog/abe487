#!/bin/perl
#01-cities.pl
#

use warnings;
use strict;
use autodie;
use Data::Dumper;
use feature "say";

my %places = (
   "Mountain View" => 'California',
    Tucson => 'Arizona',
    Ballymun => 'Dublin',
);

say Dumper(\%places);
#my @cities = keys (%places);
#print join("--",@cities),"\n";

#my @states = values(%places);
#print join("--",@states), "\n";

my $count=0;

foreach my $city (sort {$a cmp $b} keys %places){
    my $state = $places{$city};
    $count=++$count ;
    print "$count: $city, $state\n";
}
__END__
