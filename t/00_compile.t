use strict;
use warnings FATAL => 'all';
use utf8;

use Module::Find;

use t::Util;

use_ok $_ for findallmod 'HTTP::Command::Wrapper';

done_testing;

