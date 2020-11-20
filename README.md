# NAME

uc - the (sort of) universal UnCompressor

# SYNOPSIS

uc --threads _integer_ --in _infile_ > _outfile_

# DESCRIPTION

**uc** is a semi-universal front-end to various decompression programs. It
determines the type of the input file given, tries to find an appropriate
decompression program in the current PATH, and, if possible, decompresses the
file to STDOUT. The purpose is to facilitate use of heterogeneous inputs to
data analysis pipelines by providing for "universal" decompression of
compressed input data without knowing the format in advance.

# SUPPORTED FORMATS

Currently, the following formats are supported. One or more of the binaries
listed below need to be present in the current PATH in order to support that
file type. If multiple options are available, one will be chosen
preferentially in the order listed.

## GZIP

- pigz
- gzip

## BZIP2

- lbzip2
- pbzip2
- bzip2

## ZSTD

- zstd

## LZ4

- lz4

## LZIP

- plzip
- lzip

## XZ

- xz

## BSC

- bsc

# OPTIONS

- **--in**

    Path to the input file. Reading from STDIN is not supported.

- **--threads**

    The number of threads to use for decompression. Support varies by
    decompression tool. If not specified, the default for each program is
    used.

- **--help**

    Show documentation and exit

- **--version**

    Print version string and exit

# CAVEATS AND BUGS

This software has been tested on Linux only. While it should also work on
Windows, Mac OSX, BSD, and other systems with the appropriate modules
and compression tools installed, it has not been tested on these systems. 

Please report all bugs or suggestions on the software repository issues page.

# AUTHOR

Jeremy Volkening

# COPYRIGHT AND LICENSE

Copyright 2020 Jeremy Volkening <jeremy.volkening@base2bio.com>

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/).
