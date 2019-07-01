# chunkwm.pl --- chunkwm
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_tap('koekeishiya/formulae');

    # install chunkwm
    brew_install('chunkwm');
    ln( dotfile('chunkwm/chunkwmrc'), "${ENV{HOME}}/.chunkwmrc" );
    brew_services_start('chunkwm');

    # install skhd
    brew_install('skhd');
    ln( dotfile('chunkwm/skhdrc'), "${ENV{HOME}}/.skhdrc" );
    brew_services_start('skhd');

    # install ubersicht and the widgets
    brew_cask_install('ubersicht');
    ln( dotfile('ubersicht/widgets/bar-on-bottom.widget'),
"${ENV{HOME}}/Library/Application Support/Übersicht/widgets/bar-on-bottom.widget"
    );
}

1;
