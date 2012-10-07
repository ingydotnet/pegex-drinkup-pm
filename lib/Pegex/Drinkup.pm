use strict; use warnings;

package Pegex::Drinkup;

use Pegex::Parser;
use Pegex::Drinkup::Grammar;
use Pegex::Drinkup::Data;

sub parse {
    my ($self, $input) = @_;
    my $parser = Pegex::Parser->new(
        grammar => Pegex::Drinkup::Grammar->new(),
        receiver => Pegex::Drinkup::Data->new(),
    );
    return $parser->parse($input);
}

1;
