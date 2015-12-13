use strict;
use warnings FATAL => 'all';
use utf8;

use Cwd qw/abs_path/;
use File::Basename qw/basename/;
use File::Spec;
use Test::Mock::Guard qw/mock_guard/;

use t::Util;
use HTTP::Command::Wrapper;

{
    local $ENV{PATH} = abs_path(File::Spec->catfile(dirname(__FILE__), qw/.. .. .. data/));

    subtest found => sub {
        ok(HTTP::Command::Wrapper->_which('http_command_wrapper'));
    };

    subtest not_found => sub {
        ok(!HTTP::Command::Wrapper->_which('__invalid_http_command_wrapper'));
    };
};

done_testing;
