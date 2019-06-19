# plantuml.pl --- PlantUML installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    brew_cask_install('java');
    brew_install('plantuml');
}

1;
