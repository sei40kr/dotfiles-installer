# ranger.pl --- ranger installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;
use DotfilesInstaller::Facade::Pip3;

pip3_install('ranger-fm');

ln( dotfile('ranger/rc.conf'),     "${ENV{XDG_CONFIG_HOME}}/ranger/rc.conf" );
ln( dotfile('ranger/commands.py'), "${ENV{XDG_CONFIG_HOME}}/ranger/commands.py" );

1;
