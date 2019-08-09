# yabai.pl --- yabai - A tiling window manager for macOS based on binary space partitioning
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_tap('koekeishiya/formulae');

    # install yabai
    brew_install('yabai');
    ln( dotfile('yabai/yabairc'), "${ENV{HOME}}/.yabairc" );
    brew_services_start('yabai');

    # install skhd
    brew_install('skhd');
    ln( dotfile('yabai/skhdrc'), "${ENV{HOME}}/.skhdrc" );
    brew_services_start('skhd');

    # install ubersicht
    brew_cask_install('ubersicht');

    # install ubersicht widgets
    brew_cask_install('font-fontawesome');
    my @widgets =
      qw( top-bar-bg yabai-spaces yabai-active-window bottom-bar-bg );
    ln( dotfile("ubersicht/widgets/${_}.widget"),
"${ENV{HOME}}/Library/Application Support/Übersicht/widgets/${_}.widget"
    ) foreach @widgets;

    # tweak menu bar and dock to hide
    defaults_write_bool( 'Apple Global Domain', '_HIHideMenuBar', 1 );
    defaults_write_bool( 'com.apple.dock',      'autohide',       1 );
    defaults_write_float( 'com.apple.dock', 'autohide-delay', 0.0 );
}

1;
