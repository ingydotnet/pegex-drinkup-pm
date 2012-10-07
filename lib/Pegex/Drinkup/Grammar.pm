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
      '.rgx' => qr/(?-xism:\G([\s\S]*?)(?=\r?\n([A-Za-z_-]+):)\s*)/
    },
    'metadata' => {
      '.rgx' => qr/(?-xism:\G([A-Za-z_-]+):([\s\S]+)\s*\r?\n)/
    },
    'name' => {
      '.rgx' => qr/(?-xism:\G(.+?)\s*)/
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
