# Git.pm --- Git facade
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use DotfilesInstaller::Command::CommandRunner;
use Install::Logger;

my @git_clone_intermediate = ();

sub git_clone {
    my ( $repo, $dest, $branch ) = @_;
    $branch = 'master' unless ( defined($branch) );

    push(
        @git_clone_intermediate,
        {
            repo   => $repo,
            dest   => $dest,
            branch => $branch
        }
    );
}

my sub git_get_url {
    my ( $path, $remote ) = @_;

    my $url = `git -C "${path}" remote get-url ${remote} 2>/dev/null`;
    if ( $? ne 0 ) {
        return undef;
    }
    else {
        chomp $url;
        return $url;
    }
}

my sub git_current_branch {
    my $path = $_[0];
    my $branch;

    open PROC, '-|', qw(git -C), $path, qw(branch);
    while ( my $line = <PROC> ) {
        if ( substr( $line, 0, 2 ) eq '* ' ) {
            $branch = substr $line, 2;
            chomp $branch;
            last;
        }
    }
    close PROC;

    return $branch;
}

my sub git_clone_internal {
    my ( $repo, $branch, $dest ) = @_;

    my $remote_url = git_get_url( $dest, 'origin' );
    unless ( defined($remote_url) and $remote_url eq $repo ) {
        # TODO Use log_trace
        printf "> rmtree('%s');\n", $dest if ( &is_dry_run or &is_verbose );
        rmtree($dest) unless (&is_dry_run);

        my $parent_dir = dirname($dest);
        # TODO Use log_trace
        printf "> mkpath('%s');\n", $parent_dir
          if ( &is_dry_run or &is_verbose );
        mkpath($parent_dir) unless (&is_dry_run);

        run( qw(git clone -q --recurse-submodules -b),
            $branch, $repo, $dest );
    }
    elsif ( &do_update and git_current_branch($dest) eq $branch ) {
        run(qw(git pull -q --recurse-submodules=yes --ff-only -r true));
    }
}

my sub git_clone_reducer() {
    return if ( scalar(@git_clone_intermediate) eq 0 );

    log_wait('Cloning repositories ...');

    git_clone_internal( $_->{repo}, $_->{branch}, $_->{dest} )
      foreach @git_clone_intermediate;
}

register_reducer( 20, \&git_clone_reducer );

1;
