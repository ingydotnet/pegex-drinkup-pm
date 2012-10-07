package Pegex::Drinkup::Data;
use base Pegex::Receiver;

my $data;

sub initial {
    $data = {};
}

sub got_cocktail {
    $data->{name} = $_[1];
}

sub final {
    return $data;
}

1;
