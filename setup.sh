#!/bin/bash  

dotfiles=(
  'alias'
  'gitconfig'
  'gitignore'
  'ignore'

  'tmux.conf'
  'vimrc'
  'profile'

  'bin'
  'config'
  'aria2'
)

pwd=`pwd`

for dot in "${dotfiles[@]}"
do
  src="$pwd/.$dot" # can't use source, it's a command ;)
  destination="$HOME/.$dot"

  if [[ -h "$destination" ]]; then
    echo "$destination exists already, skipping"
  else
    echo "ln -s $pwd/$dot ~/.$dot"
    ln -s $pwd/.$dot ~/.$dot
  fi
done

# # Link Vim spellfile.
# # Not sure how to symlink and entire folder yet
# mkdir -p ~/.vim/spell
# # Note that you should not use `_` in the file name, see
# # https://unix.stackexchange.com/questions/85538/how-can-i-create-my-own-spelling-file-for-vim
# ln -s $pwd/vim/spell/custom-spell.utf-8.add ~/.vim/spell/custom-spell.utf-8.add

# # link folders
# ln -s $pwd/.bin/ $HOME/.bin

# # mkdir -p $HOME/.config
# ln -s $pwd/.config/ $HOME/.config

# Some of the tools install via Homebrew might need additional manual steps.
# It would be cool if this could be done as part of the Brefile run

# Install Vim-Plug to manage Vim plugins
# See https://github.com/junegunn/vim-plug/tree/c3b6b7c2971da730d66f6955d5c467db8dae536b#vim
plug_git_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

vim_plug_path="$HOME/.vim/autoload/plug.vim"
if [[ -f "$vim_plug_path" ]]; then
  echo "Looks like you already have Vim-Plug installed, skipping"
else
  curl -fLo "$vim_plug_path" --create-dirs "$plug_git_url" 
fi

#nvim plugins
nvim_plug_path="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
if [[ -f "$nvim_plug_path" ]]; then
  echo "Looks like you already have nvim-Plug installed, skipping"
else
  curl -fLo "$nvim_plug_path" --create-dirs "$plug_git_url"
fi
