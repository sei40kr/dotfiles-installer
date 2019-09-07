# utility.pl --- dotfiles installer utility
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use File::Basename qw(dirname);
use File::Path qw(mkpath rmtree);
use FindBin;
use Term::ANSIColor;
use lib "${FindBin::Bin}/lib";
use Install::CommandRunner;

my %options = (
    dry_run => 0,
    update  => 0,
    verbose => 0,
);
my @reducers = ();
my @exec_paths = split( ":", $ENV{PATH} );

sub set_dry_run {
    my $value = $_[0];

    $options{dry_run} = $value;
}

sub set_update {
    my $value = $_[0];

    $options{update} = $value;
}

sub set_verbose {
    my $value = $_[0];

    $options{verbose} = $value;
}

sub is_macos {
    return $^O eq 'darwin';
}

sub is_linux {
    return $^O eq 'linux';
}

sub log_wait {
    my $msg = $_[0];

    printf "%s %s\n", colored( '==>', 'blue' ), colored( $msg, 'bold' );
}

sub error {
    my ( $msg, $errcode ) = @_;
    $errcode = 1 unless ( defined($errcode) );

    printf "%s %s\n", colored( 'ERROR:', 'red' ), $msg;
    exit $errcode;
}

sub run_reducers {
    my @ordered_reducers = map {
        $_ ->{reducer}
    } sort {
        $a->{defer} <=> $b->{defer}
    } @reducers;

    foreach my $reducer (@ordered_reducers) {
        &{$reducer};
    }
}

sub is_dry_run {
    return $options{dry_run};
}

sub do_update {
    return $options{update};
}

sub is_verbose {
    return $options{verbose};
}

sub exec_path {
    my $cmd = $_[0];

    foreach my $path (@exec_paths) {
        return $path if ( -e "${path}/${cmd}" );
    }

    return undef;
}

sub is_exec {
    my $cmd = $_[0];

    return substr( $cmd, 0, 1 ) eq '/' ? ( -x $cmd ) : ( -x exec_path($cmd) );
}

sub register_reducer {
    my ( $defer, $reducer ) = @_;

    push(
        @reducers,
        {
            defer   => $defer,
            reducer => $reducer
        }
    );
}

1;
