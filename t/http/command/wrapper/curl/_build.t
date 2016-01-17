use strict;
use warnings FATAL => 'all';
use utf8;

use t::Util;
use HTTP::Command::Wrapper::Curl;

subtest basic => sub {
    my $curl = HTTP::Command::Wrapper::Curl->new;
    is $curl->_build([], 0), 'curl -L';
    is $curl->_build([], 1), 'curl -L --silent';
    is $curl->_build(['HEADER'], 1, ['--opt']), 'curl -L -H "HEADER" --silent --opt';
};

done_testing;
