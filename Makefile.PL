use 5.012;

use strict;
use warnings FATAL => 'all';

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'uc',
    AUTHOR           => q{Jeremy Volkening <jeremy.volkening*at*base2bio*dot*com>},
    VERSION_FROM     => 'bin/uc',
    ABSTRACT_FROM    => 'bin/uc',
    LICENSE          => 'GPL_3',
    PL_FILES         => {},
    MIN_PERL_VERSION => 5.012,
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 0,
    },
    BUILD_REQUIRES => {
        'Test::More'    => 0,
        'File::Compare' => 0,
        'File::Which'   => 0,

    },
    PREREQ_PM => {
        # core
        'File::Basename' => 0,
        'Getopt::Long' => 0,
        'List::Util' => 0,
        'Pod::Usage' => 0,

        # non-core
        'File::Which' => 0,
    },
    EXE_FILES => [qw|
        bin/uc
    |],
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources => {
            repository => {
                type => 'git',
                url => 'https://github.com/jvolkening/uc.git',
                web => 'https://github.com/jvolkening/uc',
            },
        },
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'uc-*' },
);
