#!/bin/bash 
# install script dotfiles

git clone --bare https://github.com/exception7601/dotfiles.git "$HOME/.cfg"

function dotfiles {
  /usr/bin/git --git-dir="$HOME"/.cfg/ --work-tree="$HOME" "$@"
}

mkdir -p .backup
dotfiles checkout

# Verfica se tem arquivos é faz um backup
if ! $? ; then
  echo "Checked out config.";
else
  echo "Backing up pre-existing dot files.";
  dotfiles checkout 2>&1 | grep -E "\s+\." | awk 'print $1' | xargs -I{} mv {} .backup/{}
fi;

# faz o checkout dos arquivos e configura o git
dotfiles checkout
dotfiles config status.showUntrackedFiles no
