use strict;
use warnings FATAL => 'all';
use utf8;

use File::Slurp qw/read_file/;

use t::Util;
use HTTP::Command::Wrapper::Wget;
use HTTP::Command::Wrapper::Test::Server;

subtest basic => sub {
    my $wget = HTTP::Command::Wrapper::Wget->new;
    ok $wget->fetch(uri_for('test.txt')) =~ read_file(path_for('test.txt'));
};

done_testing;