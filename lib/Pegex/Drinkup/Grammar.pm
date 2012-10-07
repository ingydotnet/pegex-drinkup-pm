package Pegex::Drinkup::Grammar;
use base Pegex::Grammar;

use constant file => 'share/drinkup.pgx';

sub make_tree {
  {
    '+grammar' => 'drinkup',
    '+toprule' => 'recipe',
    '+version' => '0.0.1',
    'cocktail' => {
      '.rgx' => qr/(?-xism:\G(?:\s*\r?\n)?(\S.*?)\s*\r?\n)/
    },
    'description' => {
      '.rgx' => qr/(?-xism:\G([\s\S]*?)(?=\r?\n[\ \t]*\*)\s*)/
    },
    'footers' => {
      '+min' => 1,
      '.ref' => 'metadata'
    },
    'ingredient' => {
      '.all' => [
        {
          '.rgx' => qr/(?-xism:\G\ *\*\ *)/
        },
        {
          '.ref' => 'number'
        },
        {
          '.rgx' => qr/(?-xism:\G\ *)/
        },
        {
          '.ref' => 'unit'
        },
        {
          '.rgx' => qr/(?-xism:\G\ *)/
        },
        {
          '.ref' => 'name'
        },
        {
          '.rgx' => qr/(?-xism:\G\ *\r?\n)/
        }
      ]
    },
    'ingredients' => {
      '+min' => 1,
      '.ref' => 'ingredient'
    },
    'instructions' => {
      '.rgx' => qr/(?-xism:\G([\s\S]*?)(?=\r?\n[0-9A-Za-z_-]+:)\s*)/
    },
    'metadata' => {
      '.rgx' => qr/(?-xism:\G([0-9A-Za-z_-]+):(.+?)\s*\r?\n)/
    },
    'name' => {
      '.rgx' => qr/(?-xism:\G(.+?)\s*(?=\r?\n))/
    },
    'number' => {
      '.rgx' => qr/(?-xism:\G((?:0|[1-9][0-9]*)?(?:\.[0-9]+)?(?:\s*\+?\s*[0-9]+\s*\/\s*[0-9]+)?))/
    },
    'recipe' => {
      '.all' => [
        {
          '.ref' => 'cocktail'
        },
        {
          '.ref' => 'description'
        },
        {
          '.ref' => 'ingredients'
        },
        {
          '.ref' => 'instructions'
        },
        {
          '.ref' => 'footers'
        }
      ]
    },
    'unit' => {
      '.rgx' => qr/(?-xism:\G(\w+)(?:\s*of)?)/
    }
  }
}

1;
