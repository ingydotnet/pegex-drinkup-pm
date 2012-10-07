use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME => 'Pegex-Drinkup',
  VERSION => '0.0.1',
  PREREQ_PM => {
    'Pegex' => '0.20',
  },
  BUILD_REQUIRES => {
    'TestML' => '0.27',
    'YAML::XS' => '0.84',
  },
  clean => { FILES => 'MANIFEST Pegex*' },
);
