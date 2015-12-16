use strict;
use warnings FATAL => 'all';
use utf8;

use Capture::Tiny qw/capture_stdout/;
use File::Slurp qw/read_file/;
use File::Spec;
use File::Temp qw/tempdir/;
use File::Which;

use t::Util;
use HTTP::Command::Wrapper::Wget;
use HTTP::Command::Wrapper::Test::Server;
use HTTP::Command::Wrapper::Test::Mock;

my $server = create_test_server;

subtest mock => sub {
    my ($stdout) = create_binary_mock {
        capture_stdout {
            my $curl = HTTP::Command::Wrapper::Wget->new;
            $curl->download($server->uri_for('test.txt'), 'dest');
        };
    };
    
    chomp $stdout;
    like $stdout, qr{wget -c  "http://127.0.0.1:\d+/test.txt" -O "dest"};
};

if (which('wget')) {
    subtest basic => sub {
        my $wget = HTTP::Command::Wrapper::Wget->new;
        my $dir  = tempdir();
        my $path = File::Spec->catfile($dir, 'test.txt');

        ok $wget->download($server->uri_for('test.txt'), $path);
        is read_file($path), read_file($server->path_for('test.txt'));
    };
}

done_testing;
