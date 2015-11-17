#!/usr/bin/env perl
#01-fasta-splitter.pl
use strict;
use warnings;
use autodie;
use feature 'say';
use Bio::SeqIO;
use Cwd 'cwd';
use File::Basename 'basename';
use File::Path 'make_path';
use File::Spec::Functions 'catfile';
use Getopt::Long;
use Pod::Usage;

my %opts = get_opts();
my @args = @ARGV or pod2usage();

if ($opts{'help'} || $opts{'man'}) {
    pod2usage({
        -exitval => 0,
        -verbose => $opts{'man'} ? 2 : 1
    });
}

my $maximum = $opts{'number'}  || 500;
my $out_dir = $opts{'out_dir'} || cwd();

unless (-d $out_dir){
    make_path($out_dir);
}

say "max ($maximum)";

for my $file (@ARGV) {
    my $in  = Bio::SeqIO->new(-file   => $file ,
                              -format => 'Fasta');
    
    my $count = 0;
    my $file_count = 0; 
    my $writer;
    while ( my $seq = $in->next_seq() ) {
        $count++;    
        if (!$writer || $count == $maximum){
            $file_count++;
            $count=0;

            my $out_file = catfile($out_dir,basename($file).'.'.$file_count);

            say $out_file;
            $writer = Bio::SeqIO->new(-file => ">$out_file",
                                      -format => 'Fasta');
        }
        say join ": ", $count, $seq->id;
        $writer->write_seq($seq);
    }
}

say "OK";

# --------------------------------------------------
sub get_opts {
    my %opts;
    GetOptions(
        \%opts,
        'number:i',
        'out_dir:s',
        'help',
        'man',
    ) or pod2usage(2);

    return %opts;
}

__END__

# --------------------------------------------------

=pod

=head1 NAME

01-fasta-splitter.pl - problem 1

=head1 SYNOPSIS

 01-fasta-splitter.pl -n 20 -o ~/split file1.fa [file2.fa ...]

Options:

  --number  The maximum number of sequences per file (500)
  --out_dir Output directory (cwd)
  --help    Show brief help and exit
  --man     Show full documentation
  
=head1 DESCRIPTION

Splits FASTA files into smaller files with a maximum number of sequences (default 500) into a given output directory (default the current working directory).

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
