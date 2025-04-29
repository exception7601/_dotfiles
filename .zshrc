# Path to your oh-my-zsh installation.
# export ZSH="$HOME/.oh-my-zsh"
# export ZSH_DISABLE_COMPFIX=true

# plugins=(
# fzf
# swiftpm
# )

# source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
#zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
# zstyle ':completion:*' file-list all

source $HOME/.alias

zmodload zsh/complist
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history

#autoload -U compinit; compinit

# cofig keybindings emg
bindkey -e

bindkey "\e[3~" delete-char
bindkey "∫" backward-word
bindkey "ƒ" forward-word
eval "$(fzf --zsh)"
eval "$(rbenv init - zsh)"
export GPG_TTY=$(tty)

# end key;
# Home key
# or you can bind it to the down key "^[[B"
# or you can bind it to Up key "^[[A"
# autosuggest keybindings

# Created by `pipx` on 2024-05-27 19:35:13
export PATH="$PATH:/Users/anderson/.local/bin"

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export PATH="/usr/local/opt/openjdk@17/bin:$PATH"

export PATH="/usr/local/opt/openjdk/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/usr/local/opt/openjdk@21/bin:$PATH"
