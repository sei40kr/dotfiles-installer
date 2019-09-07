# editorconfig.pl --- EditorConfig installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Homebrew;

if (&is_macos) {
    brew_install('editorconfig');
}

1;
