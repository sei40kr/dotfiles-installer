# Logger.pm
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use Term::ANSIColor;

sub error {
    my ( $msg, $errcode ) = @_;
    $errcode = 1 unless ( defined($errcode) );

    printf "%s %s\n", colored( 'ERROR:', 'red' ), $msg;
    exit $errcode;
}

sub log_warn {
    my $message = $_[0];

    printf "%s %s\n", colored( 'WARN:', 'yellow' ), $message;
}

sub log_wait {
    my $msg = $_[0];

    printf "%s %s\n", colored( '==>', 'blue' ), colored( $msg, 'bold' );
}

sub log_trace {
    my $to_trace = $_[0];

    # TODO Trim an blank line at last
    print "> $to_trace\n"
}

1;
