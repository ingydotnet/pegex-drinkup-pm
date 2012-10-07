use TestML -run;

BEGIN { $ENV{PERL_PEGEX_AUTO_COMPILE} = 'Pegex::Drinkup::Grammar' }
use Pegex::Drinkup;
# $Pegex::Parser::Debug = 1;

use YAML::XS;
# use XXX;

sub parse { Pegex::Drinkup->new->parse($_[0]->value) }
sub load { Load($_[0]->value) }
sub yaml { Dump($_[0]->value) }

__DATA__
%TestML 1.0

*drinkup.parse.yaml == *yaml.load.yaml;

=== test 1
--- drinkup
Tom Collins

This is a delicious beverage for a hot day.
Refreshing.

Drink it at a wedding.

 * 4 ounces of Club Soda
*2 ounce Gin
* 1 Ounce of Lemon Juice
*1 tbsp of Simple Syrup

Shake over ice. Serve.

Enjoy.

Source: 500 Cocktails, p27
--- yaml
name: Tom Collins
description: |
  This is a delicious beverage for a hot day.
  Refreshing.

  Drink it at a wedding.
ingredients:
- ingredient: Club Soda
  amount: 4
  unit: ounces
- ingredient: Gin
  amount: 2
  unit: ounce
- ingredient: Lemon Juice
  amount: 1
  unit: Ounce
- ingredient: Simple Syrup
  amount: 1
  unit: tbsp
instructions: |
  Shake over ice. Serve.

  Enjoy.
source: 500 Cocktails, p27

