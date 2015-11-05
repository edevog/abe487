#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Getopt::Long;
use Pod::Usage;

main();

# --------------------------------------------------
sub main {
    my %args = get_args();

    if ($args{'help'} || $args{'man_page'}) {
        pod2usage({
            -exitval => 0,
            -verbose => $args{'man_page'} ? 2 : 1
        });
    }

    if (scalar @ARGV != 2) {
        pod2usage();
    }

    my ($file, $pattern) = @ARGV;
    my $db = Bio::DB::Fasta->new($file);
    my @ids =grep{/$pattern/} $db->get_all_primary_ids;

    say "Found ",scalar(@ids) ," ids";

    if (scalar(@ids) > 0) {
       (my $filename = $pattern) =~ s/\W//g;
           $filename .= '.fa';
    
        my $out_file = Bio::SeqIO->new(-file   => ">$filename" ,
                                       -format => 'Fasta');

        for my $id (@ids) {                                               
            my $seq = $db->get_Seq_by_id($id);                                              $out_file->write_seq($seq);
        }
        say "See results in ", $filename;
    }
}
say "OK";

    
__END__

# --------------------------------------------------

=pod

=head1 NAME

02-fasta-search.pl - a script

=head1 SYNOPSIS

  02-fasta-search.pl 

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
