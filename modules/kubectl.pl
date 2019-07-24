# kubectl.pl --- kubectl installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    brew_install('kubectl');

    # Install helm
    brew_install('kubernetes-helm');
}

1;
