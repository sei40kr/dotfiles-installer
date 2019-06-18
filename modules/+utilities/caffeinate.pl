# caffeinate.pl --- caffeinate
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;

if (&is_macos) {
    ln(
        dotfile('caffeinate/me.yong_ju.caffeinate.plist'),
        "${ENV{HOME}}/Library/LaunchAgents/me.yong_ju.caffeinate.plist"
    );
    launchctl_load(
        "${ENV{HOME}}/Library/LaunchAgents/me.yong_ju.caffeinate.plist");
}

1;
