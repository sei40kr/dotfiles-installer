# slack.pl --- Slack installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Mas;

if (&is_macos) {
    mas_install('803453959');
}

1;
