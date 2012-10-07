package Pegex::Drinkup::Grammar;
use base Pegex::Grammar;

use constant file => 'share/drinkup.pgx';

sub make_tree {
  {
    '+grammar' => 'drinkup',
    '+toprule' => 'recipe',
    '+version' => '0.0.1',
    'STAR' => {
      '.rgx' => qr/(?-xism:\G\*)/
    },
    'description' => {
      '.rgx' => qr/(?-xism:\G([\s\S]*?)(?!:\r?\n[\ \t]*\*)\s*)/
    },
    'ingredient' => {
      '.all' => [
        {
          '.rgx' => qr/(?-xism:\G\s*)/
        },
        {
          '.ref' => 'STAR'
        },
        {
          '.rgx' => qr/(?-xism:\G\s*)/
        },
        {
          '.ref' => 'number'
        },
        {
          '.rgx' => qr/(?-xism:\G\s*)/
        },
        {
          '.ref' => 'unit'
        },
        {
          '.rgx' => qr/(?-xism:\G\s*)/
        },
        {
          '.ref' => 'name'
        }
      ]
    },
    'ingredients' => {
      '+min' => 1,
      '.ref' => 'ingredient'
    },
    'instructions' => {
      '.all' => [
        {
          '.rgx' => qr/(?-xism:\G([\s\S]*))/
        },
        {
          '.ref' => 'PEGEX'
        }
      ]
    },
    'name' => {
      '.rgx' => qr/(?-xism:\G(?:\s*\r?\n)?(\S.*?)\s*\r?\n)/
    },
    'number' => {
      '.rgx' => qr/(?-xism:\G((?:0|[1-9][0-9]*)?(?:\.[0-9]+)?(?:\s*\+?\s*[0-9]+\s*\/\s*[0-9]+)?))/
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
        },
        {
          '.ref' => 'instructions'
        }
      ]
    },
    'unit' => {
      '.rgx' => qr/(?-xism:\G(\w+)(?:\s*of)?)/
    }
  }
}

1;
