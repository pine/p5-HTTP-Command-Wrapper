use strict;
use warnings FATAL => 'all';
use utf8;

use t::Util;
use HTTP::Command::Wrapper::Wget;

subtest basic => sub {
    my $wget = HTTP::Command::Wrapper::Wget->new;
    is $wget->_headers(['User-Agent: TEST']), '--header="User-Agent: TEST"';
};

done_testing;
