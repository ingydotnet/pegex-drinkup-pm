package Pegex::Drinkup::Data;
use base Pegex::Receiver;

my $data;

sub initial {
    $data = {};
}

sub got_name {
    $data->{name} = $_[1];
}

sub final {
    return $data;
}

1;
