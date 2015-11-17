#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use Bio::SearchIO;
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

my $in = new Bio::SearchIO(-format => 'blast',
                           -file   => @ARGV);

say join "\t", qw(query_name name evalue);

while ( my $result = $in->next_result ) {
    while ( my $hit = $result->next_hit ) {
        while ( my $hsp = $hit->next_hsp ) {
            if ( $hsp->evalue < 1e-10 ) {
                say join "\t", 
                    $result->query_name,
                    $hit->name,
                    $hit->description,
                    $hsp->percent_identity, 
                    $hsp->length('total'), 
                    $hsp->evalue;
            }
        }
    }
}

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

01-bio-searchio.pl - a script

=head1 SYNOPSIS

  01-bio-searchio.pl 

Options:

  --help   Show brief help and exit
  --man    Show full documentation

=head1 DESCRIPTION

Describe what the script does, what input it expects, what output it
creates, etc.

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
