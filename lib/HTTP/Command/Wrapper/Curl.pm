package HTTP::Command::Wrapper::Curl;
use strict;
use warnings;
use utf8;

sub new {
    my ($class, $opt) = @_;
    return bless { opt => $opt } => $class;
}

sub fetch_able {
    my ($self, $url) = @_;

    `curl -LIs "$url"` =~ m/200 OK/;
}

sub fetch {
    my ($self, $url) = @_;

    `curl -Ls $url`;
}

sub download {
    my ($self, $url, $path) = @_;

    system("curl -L $url -o $path") == 0;
}

1;
