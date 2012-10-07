package Pegex::Drinkup::Grammar;
use base Pegex::Grammar;

use constant file => 'share/drinkup.pgx';

sub make_tree {
  {
    '+grammar' => 'drinkup',
    '+toprule' => 'recipe',
    '+version' => '0.0.1',
    'description' => {
      '.rgx' => qr/(?-xism:\G([\s\S]*?)(?!:\r?\n[\ \t]*\*)\s*)/
    },
    'ingredients' => {
      '.rgx' => qr/(?-xism:\G([\s\S]*))/
    },
    'name' => {
      '.rgx' => qr/(?-xism:\G(?:\s*\r?\n)?(\S.*?)\s*\r?\n)/
    },
    'recipe' => {
      '.all' => [
        {
          '.ref' => 'name'
        },
        {
          '.ref' => 'description'
        },
        {
          '.ref' => 'ingredients'
        }
      ]
    }
  }
}

1;
