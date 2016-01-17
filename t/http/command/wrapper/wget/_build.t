use strict;
use warnings FATAL => 'all';
use utf8;

use t::Util;
use HTTP::Command::Wrapper::Wget;

subtest basic => sub {
    my $curl = HTTP::Command::Wrapper::Wget->new;
    is $curl->_build([], 0), 'wget';
    is $curl->_build([], 1), 'wget --quiet';
    is $curl->_build(['HEADER'], 1, ['--opt']), 'wget --header="HEADER" --quiet --opt';
};

done_testing;
