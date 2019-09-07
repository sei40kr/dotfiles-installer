# alacritty.pl --- Alacritty installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;
use DotfilesInstaller::Facade::Homebrew;
use DotfilesInstaller::Facade::UserDefaultsSystem;

if (&is_macos) {
    brew_cask_install('alacritty');

    # Install Menlo for Powerline
    brew_cask_install('font-menlo-for-powerline');

    ln( dotfile('alacritty/alacritty.yml'),
        "${ENV{XDG_CONFIG_HOME}}/alacritty/alacritty.yml" );

    defaults_write_bool( 'NSGlobalDomain',
        'CGFontRenderingFontSmoothingDisabled', 0 );
}

1;
