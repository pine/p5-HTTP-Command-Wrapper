use strict;
use warnings FATAL => 'all';
use utf8;

use File::Slurp qw/read_file/;
use File::Which;

use t::Util;
use HTTP::Command::Wrapper::Wget;
use HTTP::Command::Wrapper::Test::Server;
use HTTP::Command::Wrapper::Test::Mock;

my $server = create_test_server;

subtest mock => sub {
    my $output = create_binary_mock {
        my $wget = HTTP::Command::Wrapper::Wget->new;
        $wget->fetch($server->uri_for('test.txt'));
    };
    
    chomp $output;
    like $output, qr{wget -q http://127\.0\.0\.1:\d+/test\.txt -O -};
};

if (which('wget')) {
    subtest basic => sub {
        my $wget = HTTP::Command::Wrapper::Wget->new;
        is $wget->fetch($server->uri_for('test.txt')), read_file($server->path_for('test.txt'));
    };
}

done_testing;
