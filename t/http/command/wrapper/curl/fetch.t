use strict;
use warnings FATAL => 'all';
use utf8;

use File::Slurp qw/read_file/;
use File::Which;

use t::Util;
use HTTP::Command::Wrapper::Curl;
use HTTP::Command::Wrapper::Test::Server;
use HTTP::Command::Wrapper::Test::Mock;

my $server = create_test_server;

subtest mock => sub {
    my $output = create_binary_mock {
        my $curl = HTTP::Command::Wrapper::Curl->new;
        $curl->fetch('uri');
    };

    chomp $output;
    like $output, qr{curl -Ls  ?"?uri"?};
};

if (which('curl')) {
    subtest basic => sub {
        my $curl = HTTP::Command::Wrapper::Curl->new;
        is $curl->fetch($server->uri_for('test.txt')), read_file($server->path_for('test.txt'));
    };
}

done_testing;
