# docker.pl --- Docker installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    brew_cask_install('docker');

    # Install Dockle
    brew_tap('goodwithtech/dockle');
    brew_install('dockle');

    # Install lazydocker
    brew_tap('jesseduffield/lazydocker');
    brew_install('lazydocker');
}

1;
