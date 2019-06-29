# yarn.pl --- Yarn installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    brew_install( 'yarn', 'without-node' );
}

1;
