# ansible.pl --- Ansible installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use DotfilesInstaller::Facade::Pip3;

pip3_install('ansible');

1;
