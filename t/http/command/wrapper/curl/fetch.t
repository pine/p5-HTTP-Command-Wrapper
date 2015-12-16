use strict;
use warnings FATAL => 'all';
use utf8;

use File::Slurp qw/read_file/;

use t::Util;
use HTTP::Command::Wrapper::Curl;
use HTTP::Command::Wrapper::Test::Server;

my $server = create_test_server;

subtest basic => sub {
    my $wget = HTTP::Command::Wrapper::Curl->new;
    is $wget->fetch($server->uri_for('test.txt')), read_file($server->path_for('test.txt'));
};

done_testing;
