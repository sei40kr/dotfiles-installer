# vim.pl --- Vim installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_install('vim');
}
elsif (&is_arch) {
    pacman_sync('vim');
}

if ( &is_macos || &is_arch ) {
    ln( dotfile('vim/vimrc'), "${ENV{HOME}}/.vimrc" );
}

1;
