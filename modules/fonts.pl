# fonts.pl --- Fonts installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Homebrew;

# 11 Best Programming Fonts - ITNEXT
# https://itnext.io/11-best-programming-fonts-724283a9ed57
if (&is_macos) {
    brew_tap('homebrew/cask-fonts');
    brew_cask_install('font-anonymous-pro');          # Anonymous Pro
    brew_cask_install('font-fantasque-sans-mono');    # Fantasque Sans Mono
    brew_cask_install('font-fira-code');              # Fira Code
    brew_cask_install('font-hack');                   # Hack
    brew_cask_install('font-inconsolata');            # Inconsolata
    brew_cask_install('font-inconsolata-dz');         # Inconsolata-dz
    brew_cask_install('font-input');                  # Input
    brew_cask_install('font-migmix-1m');              # MigMix 1M
    brew_cask_install('font-migmix-2m');              # MigMix 2M
    brew_cask_install('font-roboto-mono');            # Roboto Mono
    brew_cask_install('font-source-han-code-jp');     # Source Han Code JP

    # Powerline fonts
    brew_cask_install('font-fira-mono-for-powerline');
    brew_cask_install('font-menlo-for-powerline');

    # Nerd fonts
    brew_cask_install('font-fantasquesansmono-nerd-font-mono');
}

1;
