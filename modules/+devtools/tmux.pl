# tmux.pl --- TMUX installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;
use DotfilesInstaller::Facade::Git;
use DotfilesInstaller::Facade::Homebrew;

if (&is_macos) {
    brew_install('tmux');
    brew_install('reattach-to-user-namespace');

    ln( dotfile('tmux/tmux.conf'), "${ENV{HOME}}/.tmux.conf" );

    git_clone(
        'https://github.com/tmux-plugins/tpm.git',
        "${ENV{HOME}}/.tmux/plugins/tpm"
    );

    # Install terminfo files
    tic( dotfile('terminfo/all-in-one.ti') );
}

1;
