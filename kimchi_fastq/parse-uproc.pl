#!/usr/bin/env perl

use strict;
use warnings;
use autodie;
use feature 'say';
use Data::Dumper;
use Getopt::Long;
use Pod::Usage;

my %opts = get_opts();
@ARGV or pod2usage('Need uproc input files');

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

open my $fh, '<', 'KO_to_mapdesc';
my %ko_to_map;
while (my $line = <$fh>) {
    chomp($line);
    if (my ($ko, $desc) = split(/\s+/, $line, 2)) {
        push @{ $ko_to_map{ $ko } }, $desc;
    }
}
for my $file (@ARGV) {
    open my $fh, '<', $file;

    my %up;
    while (my $line = <$fh>) {
        chomp($line);
        my ($ko, $count) = split(/,/, $line);
        next unless defined $ko_to_map{ $ko };
        my @pathways = @{ $ko_to_map{ $ko } };

        for my $pathway (@pathways) {
            $up{ $pathway } += $count;
        }
    }

    close $fh;
    my $output_file="${file}_output.txt";
    open my $fh_out, '>', $output_file;
    my $count=0;
    foreach my $name  (sort { $up{$b} <=> $up{$a} }  keys %up){
        $count++;
        if ($count<5000){
            say $fh_out join("\t", $name, $up{$name});
        }
    }
    say "See '$output_file'";
}

#say Dumper(\%ko_to_map);

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

parse-uproc.pl - a script

=head1 SYNOPSIS

  parse-uproc.pl 

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
