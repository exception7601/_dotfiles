#!/bin/bash

dotfiles=(
  'alias'
  'gitconfig'
  'gitignore'
  'ignore'

  'vimrc'
  'zshrc'
  'zshenv'
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

brew bundle install --file .backup/Brewfile
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

# Hammerspoon window manager
# http://www.hammerspoon.org/
mkdir -p $HOME/.hammerspoon
ln -s $pwd/.hammerspoon/init.lua $HOME/.hammerspoon/init.lua

# # link folders
ln -sn $pwd/.config $HOME/.config
ln -sn $pwd/.aria2 $HOME/.aria2
ln -sn $pwd/.bin $HOME/.bin
ln -sn $pwd/.config/agents $HOME/.agents
ln -sn $pwd/.pi $HOME/.pi

# settings
ln -s $pwd/.gemini/settings.json $HOME/.gemini/settings.json
ln -s $pwd/.claude/settings.json $HOME/.claude/settings.json
ln -s $pwd/.codex/config.toml $HOME/.codex/config.toml
ln -s $HOME/Developer/_dotfiles/.tmux.conf $HOME/.tmux.conf

# context
ln -s $pwd/.config/agents/AGENTS.md $pwd/.config/opencode/AGENTS.md
ln -s $pwd/.config/agents/AGENTS.md $pwd/.pi/agent/AGENTS.md
ln -s $pwd/.config/agents/AGENTS.md $HOME/.gemini/GEMINI.md
ln -s $pwd/.config/agents/AGENTS.md $HOME/.codex/AGENTS.md

ln -sn $pwd/.config/agents/skills $HOME/.claude/skills

# .ssh
# cp -r $pwd/.ssh/ $HOME/.ssh

# System Config
defaults -currentHost write -g AppleFontSmoothing -int 0
defaults write com.apple.screencapture location $HOME/Pictures/ScreenShots
defaults write com.apple.dock autohide -bool true

# mise
mise trust "$HOME/Developer/_dotfiles/.config/mise/config.toml"
mise up
