# scala.pl --- Scala environment
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

# TODO Install scala

# Install coursier
brew_tap('coursier/formulas');
brew_install('coursier');

# TODO Install metals

brew_install('scalastyle');

1;
