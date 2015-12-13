use strict;
use warnings FATAL => 'all';
use utf8;

use File::Slurp qw/read_file/;
use File::Spec;
use File::Temp qw/tempdir/;

use t::Util;
use HTTP::Command::Wrapper::Curl;
use HTTP::Command::Wrapper::Test::Server;

subtest basic => sub {
    my $curl = HTTP::Command::Wrapper::Curl->new;
    my $dir  = tempdir();
    my $path = File::Spec->catfile($dir, 'test.txt');

    ok $curl->download(uri_for('test.txt'), $path);
    is read_file($path), read_file(path_for('test.txt'));
};

done_testing;
