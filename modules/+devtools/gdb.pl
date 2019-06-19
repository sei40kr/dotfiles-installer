# gdb.pl --- gdb (and gdb-dashboard) installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    brew_install('gdb');
    curl(
'https://raw.githubusercontent.com/cyrus-and/gdb-dashboard/master/.gdbinit',
        "${ENV{HOME}}/.gdbinit"
    );
}

1;
