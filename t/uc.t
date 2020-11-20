#!/usr/bin/env perl

use 5.012;

use strict;
use warnings;

use File::Compare;
use File::Temp qw/tempfile/;
use File::Which;
use Test::More;

my $bin     = 'bin/uc';
my $in_unc  = 't/test_data/LICENSE';

my $min_to_test = 2;
my $n_tested = 0;

my %extensions = (
    gzip   => 'gz',
    pigz   => 'gz',
    bzip2  => 'bz2',
    pbzip2 => 'bz2',
    lbzip2 => 'bz2',
    zstd   => 'zst',
    lz4    => 'lz4',
    plzip  => 'lzip',
    lzip   => 'lzip',
    xz     => 'xz',
    #bsc    => 'bsc',
);

PROG:
for my $prog (keys %extensions) {
    
    # Don't run tests if program not installed
    next PROG
        if (! defined which($prog));

    my ($tmpfh, $tmpfn) = tempfile( UNLINK => 1);

    my $fn = "$in_unc.$extensions{$prog}";
    open my $stream, '-|',
        $bin,
        '--in' => $fn,
    ;
    while (my $line = <$stream>) {
        print {$tmpfh} $line;
    }
    close $tmpfh;
    close $stream
        or die "Error running uc: $!";

    ok( compare($in_unc => $tmpfn) == 0, "$prog outputs match" );

    ($tmpfh, $tmpfn) = tempfile( UNLINK => 1);

    open $stream, '-|',
        $bin,
        '--in' => $fn,
        '--threads' => 2,
    ;
    while (my $line = <$stream>) {
        print {$tmpfh} $line;
    }
    close $tmpfh;
    close $stream
        or die "Error running uc: $!";

    ok( compare($in_unc => $tmpfn) == 0, "$prog outputs match with threads" );

    ++$n_tested;

}

ok( $n_tested > $min_to_test, "tested at least $min_to_test program(s)" );

done_testing();
