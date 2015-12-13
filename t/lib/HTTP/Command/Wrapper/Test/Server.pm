package HTTP::Command::Wrapper::Test::Server;
use strict;
use warnings;
use utf8;

use Cwd qw/abs_path/;
use File::Spec;
use File::Basename qw/dirname/;
use Test::TCP;
use Plack::Loader;
use Plack::Middleware::Static;

sub import {
    server();

    no strict 'refs';

    my $caller  = caller;
    *{"${caller}::$_"} = \&{__PACKAGE__."::$_"} for qw/uri_for path_for/;
}

my $server;
sub server {
    return $server if $server;

    my $app = sub {
        my $env = shift;

        Plack::Middleware::Static->new({
            path => sub { 1 },
            root => path_for(),
        })->call($env);
    };

    $server = Test::TCP->new(
        code => sub {
            my $port   = shift;
            my $server = Plack::Loader->auto(
                port => $port,
                host => '127.0.0.1',
            );
            $server->run($app);
        },
    );

    return $server;
}

sub port {
    return server()->port;
}

sub uri_for {
    my $path = shift;
    my $port = server()->port;
    return "http://127.0.0.1:$port/$path";
}

sub path_for {
    my $path = shift;
    $path = '' unless defined $path;
    return abs_path(File::Spec->catfile(dirname(__FILE__), qw/.. .. .. .. .. data htdocs/, $path)),
}

1;
