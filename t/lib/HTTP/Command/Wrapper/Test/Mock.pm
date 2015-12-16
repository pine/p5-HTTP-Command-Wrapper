package HTTP::Command::Wrapper::Test::Mock;
use strict;
use warnings;
use utf8;

use Cwd qw/abs_path/;
use Exporter qw/import/;
use File::Spec;
use File::Basename qw/dirname/;

our @EXPORT = qw/create_binary_mock/;

sub create_binary_mock (&) {
	my $code = shift;
	local $ENV{PATH} = abs_path(File::Spec->catfile(dirname(__FILE__), qw/.. .. .. .. .. data bin/));
	$code->();
}

1;