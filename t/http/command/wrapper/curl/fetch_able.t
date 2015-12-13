use strict;
use warnings FATAL => 'all';
use utf8;

use Test::Mock::Guard qw/mock_guard/;

use t::Util;
use HTTP::Command::Wrapper::Curl;
use HTTP::Command::Wrapper::Test::Server;

subtest basic => sub {
    my $wget = HTTP::Command::Wrapper::Curl->new;
    ok $wget->fetch_able(uri_for('test.txt'));
    ok !$wget->fetch_able(uri_for('test2.txt'));
};

done_testing;
