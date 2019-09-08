# HaskellToolStack.pm --- Haskell Tool Stack facade
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use DotfilesInstaller::Command::CommandRunner;
use Install::Logger;

my @stack_install_intermediate = ();

sub stack_install {
    my ( $pkg, @flags ) = @_;

    push(
        @stack_install_intermediate,
        {
            pkg   => $pkg,
            flags => \@flags
        }
    );
}

my sub stack_install_reducer {
    return if ( scalar(@stack_install_intermediate) eq 0 );

    log_wait('Installing Stack packages ...');

    error('stack not found.') unless is_exec('stack');

    my @stack_pkgs         = ();
    my @stack_install_opts = ();
    foreach my $item (@stack_install_intermediate) {
        my $pkg = $item->{pkg};
        push( @stack_pkgs, $pkg );
        push( @stack_install_opts, ( '--flag', "${pkg}:${_}" ) )
          foreach @{ $item->{flags} };
    }

    run( qw(stack install), @stack_pkgs, @stack_install_opts );
}

register_reducer( 60, \&stack_install_reducer );

1;
