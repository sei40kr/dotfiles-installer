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

    # Install Trivy
    brew_tap('knqyf263/trivy');
    brew_install('trivy');

    # Install lazydocker
    brew_tap('jesseduffield/lazydocker');
    brew_install('lazydocker');
}

1;
