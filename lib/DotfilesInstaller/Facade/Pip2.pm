# Pip2.pm --- Pip2 facade
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::CommandRunner;
use Install::Logger;

my @pip2_install_intermediate = ();

sub pip2_install {
    my $pkg = $_[0];

    push( @pip2_install_intermediate, $pkg );
}

my sub find_pip2_exec {
    foreach
      my $dirpath ( "${ENV{HOME}}/.pyenv/shims", "/usr/local/bin", "/usr/bin" )
    {
        return "${dirpath}/pip2" if ( -x "${dirpath}/pip2" );
    }
}

my sub pip2_install_reducer {
    push( @pip2_install_intermediate, 'pip' ) if (&do_update);
    return if ( scalar(@pip2_install_intermediate) eq 0 );

    log_wait('Installing Python2 packages ...');

    my $pip2_exec = &find_pip2_exec;
    error('pip2 is not found.') unless ( defined($pip2_exec) );

    my @args = qw(install --exists-action i);
    push( @args, ( &do_update ? '-U' : '--disable-pip-version-check' ) );
    run( $pip2_exec, @args, @pip2_install_intermediate );
}

register_reducer( 61, \&pip2_install_reducer );
