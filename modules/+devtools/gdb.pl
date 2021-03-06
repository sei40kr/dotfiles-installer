# gdb.pl --- gdb (and gdb-dashboard) installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Curl;
use DotfilesInstaller::Facade::Homebrew;
use DotfilesInstaller::Facade::Pip3;

if (&is_macos) {
    brew_install('gdb');
    pip3_install('gdb-tools');
    curl(
'https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit',
        "${ENV{HOME}}/.gdbinit"
    );
}

1;
