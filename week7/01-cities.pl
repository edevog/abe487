#!/bin/perl
#01-cities

use warnings;
use strict;
use autodie;
use Data::Dumper;

#"All at once":

my %hash = (
   "Mountain View" => 'California',
            Tucson => 'Arizona',
          Ballymun => 'Dublin',
);

say Dumper(\%hash);
