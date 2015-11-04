#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use Bio::Seq;
use Bio::SeqIO;
use feature 'say';
use Getopt::Long;
use Pod::Usage;

my %opts = get_opts();
my @args = @ARGV;

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

for my $file (@ARGV) {
    my $in = Bio::SeqIO->new(-file   => $file,
                             -format => 'Genbank');

#    while (my $seq = $in->next_seq){
#        for my $feat_object ($seq->get_SeqFeatures) {          
#           print "primary tag: ", $feat_object->primary_tag, "\n";          
#           for my $tag ($feat_object->get_all_tags) {             
#              print "  tag: ", $tag, "\n";             
#              for my $value ($feat_object->get_tag_values($tag)) {                
#                 print "    value: ", $value, "\n";             
#              }          
#           }       
#        }
#    }
my $count = 0;
    while (my $seq = $in->next_seq){
        my @cds = grep { $_->primary_tag eq 'CDS' } $seq->top_SeqFeatures;
        #say Dumper(\@cds); use Data::Dumper;
        $count++; 
        my $seq_id = $seq->id;
        my $ncds   = scalar @cds;
        say "$seq_id has $ncds CDS";
        my $i; 
        for my $cds (@cds) {
            say ++$i, ": ", $cds->get_tag_values('translation');
        }
    }
}
say "OK";

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

03-find-cds.pl - problem 3

=head1 SYNOPSIS

Usage:
      03-find-cds.pl rec.gb [rec2.gb ...]

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Prints the coding regions (CDSs) of the genbank records. The script can handle multiple input files, multiple sequence per file and multiple CDSs per sequence.

=head1 SEE ALSO

perl.

=head1 AUTHOR

Beth De Vogelaere E<lt>edevog@email.arizona.eduE<gt>.

=head1 COPYRIGHT

Copyright (c) 2015 Beth De Vogelaere

This module is free software; you can redistribute it and/or
modify it under the terms of the GPL (either version 1, or at
your option, any later version) or the Artistic License 2.0.
Refer to LICENSE for the full license text and to DISCLAIMER for
additional warranty disclaimers.

=cut
