# zsh.pl --- Z-shell installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_install('zsh');

    ln( dotfile('zsh/zshenv'),        "${ENV{HOME}}/.zshenv" );
    ln( dotfile('zsh/zshenv'),        "${ENV{HOME}}/.zsh/.zshenv" );
    ln( dotfile('zsh/zprofile'),      "${ENV{HOME}}/.zsh/.zprofile" );
    ln( dotfile('zsh/zshrc'),         "${ENV{HOME}}/.zsh/.zshrc" );
    ln( dotfile('zsh/func_defs.zsh'), "${ENV{HOME}}/.zsh/func_defs.zsh" );
    ln(
        dotfile('zsh/func_defs_emacs.zsh'),
        "${ENV{HOME}}/.zsh/func_defs_emacs.zsh"
    );
    ln( dotfile('zsh/alias_defs.zsh'), "${ENV{HOME}}/.zsh/alias_defs.zsh" );

    # Install completions
    my @zsh_completions = qw(_atcoder-tools _kubectl _rustup);
    ln( dotfile("zsh/completions/${_}"), "${ENV{HOME}}/.zsh/completions/${_}" )
      foreach @zsh_completions;

    # Install functions
    my @zsh_funcs =
      qw(clone_gh create_gh dcin dii dirm dni drm drmf dst dstp dvi dxb fzf-remote-widget fzf-project-widget kca kres magit pyclean ranger-cd);
    ln( dotfile("zsh/functions/${_}"), "${ENV{HOME}}/.zsh/functions/${_}" )
      foreach @zsh_funcs;

    brew_install('bat');
    brew_install('diff-so-fancy');
    brew_install('exa');
    brew_install('htop');
    brew_install('ncdu');
    brew_install('prettyping');
    brew_install('tree');

    # Install zplugin and my plugins
    git_clone( 'https://github.com/zdharma/zplugin.git',
        "${ENV{HOME}}/.zplugin/bin" );

    git_clone(
        'https://github.com/sei40kr/zsh-fzf-docker.git',
        "${ENV{HOME}}/.zplugin/plugins/_local---zsh-fzf-docker"
    );
    git_clone(
        'https://github.com/sei40kr/zsh-fast-alias-tips.git',
        "${ENV{HOME}}/.zplugin/plugins/_local---zsh-fast-alias-tips"
    );
}

1;
