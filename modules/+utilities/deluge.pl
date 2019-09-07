# deluge.pl --- Deluge installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Homebrew;
use DotfilesInstaller::Facade::Pip3;

if (&is_macos) {
    brew_cask_install('deluge');
}

pip3_install('deluge-client');

1;
