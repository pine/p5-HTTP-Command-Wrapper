package HTTP::Command::Wrapper::Wget;
use strict;
use warnings;
use utf8;

sub new {
    my ($class, $opt) = @_;
    return bless { opt => $opt } => $class;
}

sub fetch_able {
    my ($self, $url) = @_;

    `wget -Sq --spider "$url" 2>&1` =~ m/200 OK/;
}

sub fetch {
    my ($self, $url) = @_;

    `wget -q $url -O -`;
}

sub download {
    my ($self, $url, $path) = @_;

    system("wget -c $url -O $path") == 0;
}

1;
