# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_DISABLE_COMPFIX=true
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

plugins=(
 fzf
 gh
 docker-compose 
 docker
 # git 
 # swiftpm
 # tmux
 # macos
 # brew
)

source $ZSH/oh-my-zsh.sh
zstyle ':completion:*' menu select
#zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*' file-list all

typeset -U PATH path
path=("$HOME/.bin:" "$path[@]")
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/openjdk@17/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH=$HOME/.mint/bin:$PATH
export GPG_TTY=$(tty)

source $HOME/.alias

# enter in vi mode using esc
# bindkey -v
export KEYTIMEOUT=1

# edit comand in vim
export GH_PAGER=cat
export GIT_PAGER=cat

export EDITOR="vim"
export VISUAL="vim"
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

#autoload -U compinit; compinit

export FZF_BASE=/usr/local/bin/fzf
export DISABLE_FZF_AUTO_COMPLETION="true"
export DISABLE_FZF_KEY_BINDINGS="true"

# end key;
# Home key
# or you can bind it to the down key "^[[B"
# or you can bind it to Up key "^[[A"
# autosuggest keybindings

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
