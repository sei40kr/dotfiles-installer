# dashboard.pl
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::UserDefaultsSystem;

if (&is_macos) {

    # Disable Dashboard
    defaults_write_bool( 'com.apple.dashboard', 'mcx-disabled', 1 );
}

1;
