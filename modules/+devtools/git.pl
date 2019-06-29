# git.pl --- Git installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_install('git');
    brew_install('git-flow');

    ln( dotfile('git/gitconfig'), "${ENV{HOME}}/.gitconfig" );
    ln( dotfile('git/gitignore'), "${ENV{HOME}}/.gitignore_global" );
}

1;
