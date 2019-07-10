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

    # Install chunkwm
    brew_install( 'chunkwm', 'with-purify', 'without-ffm' );
    ln( dotfile('chunkwm/chunkwmrc'), "${ENV{HOME}}/.chunkwmrc" );
    brew_services_start('chunkwm');

    # Install skhd
    brew_install('skhd');
    ln( dotfile('chunkwm/skhdrc'), "${ENV{HOME}}/.skhdrc" );
    brew_services_start('skhd');
    # Install utility scripts
    ln(
        dotfile('chunkwm/toggle-chunkwm-layout'),
        "${ENV{HOME}}/.local/bin/toggle-chunkwm-layout"
    );

    # Install Ubersicht
    brew_cask_install('ubersicht');
    # Install bar-on-bottom widget
    ln( dotfile('ubersicht/widgets/bar-on-bottom.widget'),
"${ENV{HOME}}/Library/Application Support/Übersicht/widgets/bar-on-bottom.widget"
    );
}

1;
