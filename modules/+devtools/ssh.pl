# ssh.pl
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

ln( dotfile('ssh/config'), "${ENV{HOME}}/.ssh/config" );

1;
