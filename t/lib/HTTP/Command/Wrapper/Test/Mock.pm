package HTTP::Command::Wrapper::Test::Mock;
use strict;
use warnings;
use utf8;

use Config;
use Exporter qw/import/;
use File::Spec;
use File::Basename qw/dirname/;
use Sys::Info;

our @EXPORT = qw/
    create_binary_mock
    create_dummy_wgetrc
/;

my $data_path = File::Spec->rel2abs(
    File::Spec->catfile(dirname(__FILE__), qw/.. .. .. .. .. data/));

sub create_binary_mock (&) {
    my $code      = shift;
    my $mock_path = File::Spec->catfile($data_path, 'bin');
    my $path      = $mock_path;
    my $info      = Sys::Info->new;

    if ($info->os->is_windows) {
        $path .= $Config{path_sep};
        $path .= dirname($ENV{COMSPEC});
    }

    else {
        $path .= $Config{path_sep};
        $path .= $ENV{PATH};
    }

    local $ENV{PATH} = $path;
    return $code->();
}

sub create_dummy_wgetrc (&) {
    my $code      = shift;
    my $mock_path = File::Spec->catfile($data_path, 'rc/.wgetrc');

    local $ENV{WGETRC} = $mock_path;
    return $code->();
}

1;
