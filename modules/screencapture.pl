# screencapture.pl
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::UserDefaultsSystem;

if (&is_macos) {

    # Disable shadow in screenshots
    defaults_write_bool( 'com.apple.screencapture', 'disable-shadow', 1 );
}

1;
