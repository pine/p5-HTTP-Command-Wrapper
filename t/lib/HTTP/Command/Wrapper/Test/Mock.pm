package HTTP::Command::Wrapper::Test::Mock;
use strict;
use warnings;
use utf8;

use Config;
use Exporter qw/import/;
use File::Spec;
use File::Basename qw/dirname/;

our @EXPORT = qw/create_binary_mock/;

sub create_binary_mock (&) {
    my $code      = shift;
    my $mock_path = File::Spec->rel2abs(File::Spec->catfile(dirname(__FILE__), qw/.. .. .. .. .. data bin/));
    my $sys_path  = defined $ENV{COMSPEC} ? dirname($ENV{COMSPEC}) : undef;
    my $path      = $mock_path;

    $path .= $Config{path_sep}.$sys_path if defined $sys_path;
    local $ENV{PATH} = $path;

    return $code->();
}

1;