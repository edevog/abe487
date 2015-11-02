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

    my $program = $args{'program'} or pod2usage('Missing program');
    my $argument = $args{'argument'} or pod2usage('Missing argument');

    if ($program eq 'hello') {
        hello($argument); 
    }
    elsif ($program eq 'rc') {
        rc($argument); 
    }
    else {
        pod2usage("Can't even");
    }
}

sub hello {
    my $name = shift;
    say "Hello, $name";
}

sub rc {
    my $seq = shift;
    $seq = reverse $seq;
    $seq =~ tr/ACTGactg/TGACtgac/;
    say $seq;
}

# --------------------------------------------------
sub get_args {
    my %args;
    GetOptions(
        \%args,
        'program=s',
        'argument=s',
        'help',
        'man',
    ) or pod2usage(2);

    return %args;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-subs.pl - practice writing subs

=head1 SYNOPSIS

  01-subs.pl -p hello -a world

  01-subs.pl -p rc -a AACAACTGA


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
