# spacemacs.pl --- Spacemacs installer
# author: Seong Yong-ju <sei40kr@gmail.com>

use utf8;
use strict;
use warnings;
use FindBin;
use lib "${FindBin::Bin}/lib";
use Install::PathResolver;

if (&is_macos) {
    brew_tap('railwaycat/emacsmacport');
    brew_cask_install('emacs-mac-spacemacs-icon');

    # Install Menlo for Powerline
    brew_cask_install('font-menlo-for-powerline');

    tic( dotfile('terminfo/eterm-color.ti') );
}

ln( dotfile('emacs/bin/edebug'), "${ENV{HOME}}/.local/bin/edebug" );
ln(
    dotfile('emacs/bin/emacs-wrapper'),
    "${ENV{HOME}}/.local/bin/emacs-wrapper"
);

git_clone( 'ssh://git@github.com/sei40kr/spacemacs.git',
    "${ENV{HOME}}/.emacs.d", 'develop' );

git_clone(
    'ssh://git@github.com/sei40kr/competitive-programming-snippets.git',
    "${ENV{HOME}}/develop/workspace/competitive-programming-snippets"
);
ln(
    "${ENV{HOME}}/develop/workspace/competitive-programming-snippets",
    "${ENV{HOME}}/.emacs.d/private/local/competitive-programming-snippets"
);

git_clone(
    'ssh://git@github.com/sei40kr/jest-snippets.git',
    "${ENV{HOME}}/develop/workspace/jest-snippets"
);
ln(
    "${ENV{HOME}}/develop/workspace/jest-snippets",
    "${ENV{HOME}}/.emacs.d/private/local/jest-snippets"
);

git_clone(
    'ssh://git@github.com/sei40kr/rails-snippets.git',
    "${ENV{HOME}}/develop/workspace/rails-snippets"
);
ln(
    "${ENV{HOME}}/develop/workspace/rails-snippets",
    "${ENV{HOME}}/.emacs.d/private/local/rails-snippets"
);

git_clone(
    'ssh://git@github.com/sei40kr/react-snippets.git',
    "${ENV{HOME}}/develop/workspace/react-snippets"
);
ln(
    "${ENV{HOME}}/develop/workspace/react-snippets",
    "${ENV{HOME}}/.emacs.d/private/local/react-snippets"
);

git_clone(
    'ssh://git@github.com/sei40kr/redux-snippets.git',
    "${ENV{HOME}}/develop/workspace/redux-snippets"
);
ln(
    "${ENV{HOME}}/develop/workspace/redux-snippets",
    "${ENV{HOME}}/.emacs.d/private/local/redux-snippets"
);

git_clone( 'ssh://git@github.com/sei40kr/spacemacs.d.git',
    "${ENV{HOME}}/.spacemacs.d" );

if (&is_macos) {

    # Use thin strokes for antialiased text
    defaults_write_int( 'org.gnu.Emacs', 'AppleFontSmoothing', 1 );
}

# Ansible
pip2_install('ansible-lint');

# C/C++
if (&is_macos) {
    brew_install('cquery');
    brew_install('clang-format');
}
pip3_install('cmakelint');
pip3_install('cpplint');

# Docker
yarn_global_add('dockerfile-language-server-nodejs');

# ESS
if (&is_macos) {
    brew_install( 'r', 'with-openblas' );
}

# Go
go_get('github.com/cweill/gotests/...');
go_get('github.com/davidrjenni/reftools/cmd/fillstruct');
go_get('github.com/fatih/gomodifytags');
go_get('github.com/godoctor/godoctor');
go_get('github.com/haya14busa/gopkgs/cmd/gopkgs');
go_get('github.com/josharian/impl');
go_get('github.com/nsf/gocode');
go_get('github.com/rogpeppe/godef');
go_get('github.com/zmb3/gogetdoc');
go_get('golang.org/x/tools/cmd/godoc');
go_get('golang.org/x/tools/cmd/goimports');
go_get('golang.org/x/tools/cmd/gorename');
go_get('golang.org/x/tools/cmd/guru');

# Haskell
stack_install('apply-refact');

# stack_install('ghc-mod');
stack_install('hasktags');
stack_install('hindent');
stack_install('hlint');
stack_install('hoogle');
stack_install('stylish-haskell');

# HTML
yarn_global_add('stylelint-cli');

# JavaScript
yarn_global_add('eslint-cli');
yarn_global_add('import-js');
ln( dotfile('import-js/importjs.js'), "${ENV{HOME}}/.importjs.js" );
yarn_global_add('prettier');
yarn_global_add('prettier-eslint-cli');
yarn_global_add('javascript-typescript-langserver');

# Jupyter Notebook
pip3_install('jupyter');
pip3_install('numpy');
pip3_install('pandas');
pip3_install('matplotlib');
if (&is_linux) {
    ln( dotfile('matplotlib/matplotlibrc'),
        "${ENV{XDG_CONFIG_HOME}}/matplotlib/matplotlibrc" );
}
elsif (&is_macos) {
    ln(
        dotfile('matplotlib/matplotlibrc'),
        "${ENV{HOME}}/.matplotlib/matplotlibrc"
    );
}

# Markdown
gem_install('mdl');
yarn_global_add('markdownlint-cli');
yarn_global_add('vmd');

# Org
git_clone( 'https://github.com/hakimel/reveal.js.git',
    "${ENV{HOME}}/org/reveal-js" );

# Pandoc
if (&is_macos) {
    brew_install('pandoc');
    brew_cask_install('wkhtmltopdf');
}

# Perl5
cpanm('App::PRT');
cpanm('File::Zglob');
cpanm('Perl::Critic');
cpanm('Perl::Tidy');

# Python
pip3_install('autopep8');
pip3_install('flake8');
pip3_install('importmagic');
pip3_install('epc');    # importmagic dep
pip3_install('jedi');
pip3_install('ptsvd');
pip3_install('pydoc_utils');
pip3_install('pyflakes');
pip3_install('pylint');
pip3_install('pyls-isort');
pip3_install('pyls-mypy');
pip3_install('python-language-server');
pip3_install('rope');
pip3_install('yapf');

# Ruby
gem_install('clippy');
gem_install('fastri');
gem_install('pry');
gem_install('pry-coolline');
gem_install('pry-doc');
ln( dotfile('pry/pryrc'), "${ENV{HOME}}/.pryrc" );
gem_install('rake');
gem_install('rcodetools');
gem_install('rubocop');
gem_install('seeing_is_believing');
gem_install('solargraph');

# Rust
cargo_nightly_install('racer');
cargo_nightly_install('rustfmt-nightly');
rustup_component_add('rls-preview');
rustup_component_add('rust-analysis');
rustup_component_add('rust-src');

# Shell-script
brew_install('shellcheck');
go_get('mvdan.cc/sh/cmd/shfmt');

# SQL
pip3_install('sqlint');
pip3_install('sqlparse');

# TypeScript
yarn_global_add('tslint');
yarn_global_add('typescript');
yarn_global_add('typescript-formatter');
yarn_global_add('typescript-language-server');

# YAML
pip3_install('yamllint');

1;
