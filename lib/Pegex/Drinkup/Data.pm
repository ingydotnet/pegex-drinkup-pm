package Pegex::Drinkup::Data;
use base Pegex::Receiver;

my $data;

sub initial {
    $data = {};
}

sub got_cocktail {
    $data->{name} = $_[1];
}

sub got_description {
    $data->{description} = $_[1];
}

sub got_instructions {
    $data->{instructions} = $_[1];
}

sub got_ingredients {
    $data->{ingredients} = [
        map {
            {
               amount => 0 + $_->[0],
               unit => $_->[1],
               ingredient => $_->[2],
               notes => $_->[3],
            }
        } @{$_[1]}
    ];
}

sub got_metadata {
    $data->{lc $_[1]->[0]} = $_[1]->[1]
}

sub final {
    return $data;
}

1;
