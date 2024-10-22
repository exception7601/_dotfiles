# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

export BROWSER=open
export EDITOR=nvim
export VISUAL=nvim

# Configure Lang in ssh
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export PAGER=less
export LESS='-F -g -i -M -R -S -w -X -z-4'

export GH_PAGER=cat
export GIT_PAGER=cat

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_BASE=/usr/local/bin/fzf
export DISABLE_FZF_AUTO_COMPLETION=true
export DISABLE_FZF_KEY_BINDINGS=true
export FZF_DEFAULT_COMMAND='fd --strip-cwd-prefix --hidden --follow --exclude .git --ignore-file $HOME/.ignore'
export FZF_CTRL_T_COMMAND='fd --strip-cwd-prefix --hidden --follow --exclude .git --ignore-file $HOME/.ignore'

export KEYTIMEOUT=1
export HISTSIZE=2000
export SAVEHIST=1000

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# export LSCOLORS=GxFxCxDxBxegedabagaced
#
#

if [ -e /home/pi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/pi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
