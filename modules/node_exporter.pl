# node_exporter.pl --- node_exporter installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Homebrew;

brew_install('node_exporter');

1;
