# asciinema.pl
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Homebrew;
use DotfilesInstaller::Facade::Pip3;
use DotfilesInstaller::Facade::Yarn;

if (&is_macos) {
    brew_install('giflossy');
    brew_install('imagemagick');
}

pip3_install('asciinema');

yarn_global_add('asciicast2gif');

1;
