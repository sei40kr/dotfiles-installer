# intellij-idea.pl --- IntelliJ IDEA
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_cask_install('intellij-idea');

    # install intelli-space, Spacemacs like key bindings for Intellij Platform
    git_clone( 'https://github.com/MarcoIeni/intelli-space.git',
        "${ENV{HOME}}/intelli-space" );

    ln( dotfile('intellij-idea/ideavimrc'), "${ENV{HOME}}/.ideavimrc" );
}

1;
