# skype.pl --- Skype installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    brew_cask_install('skype');
} else {
    # TODO Install skype
}

1;
