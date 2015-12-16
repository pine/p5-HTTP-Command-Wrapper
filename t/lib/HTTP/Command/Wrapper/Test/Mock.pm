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
    my $path      = $mock_path;

    $path .= $Config{path_sep}.dirname($ENV{COMSPEC}) if defined $ENV{COMSPEC};
    local $ENV{PATH} = $path;

    return $code->();
}

1;