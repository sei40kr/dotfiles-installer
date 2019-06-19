# latex.pl --- LaTeX installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    brew_install('ghostscript');
    brew_cask_install('basictex');
}

1;
