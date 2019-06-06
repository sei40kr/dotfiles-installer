# Path.pm
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;

sub dotfile {
    my $relative_path = $_[0];

    return "${ENV{HOME}}/.dotfiles/${relative_path}";
}

1;
