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

function fzf-widget {
  fzf --print0 --height=100% --layout=default <"$TTY" | xargs -0 -o nvim
}

zle -N fzf-widget
# cofig keybindings emg
bindkey -e

bindkey "∂" fzf-widget
bindkey "\e[3~" delete-char
bindkey "∫" backward-word
bindkey "ƒ" forward-word

eval "$(fzf --zsh)"
# eval "$(rbenv init - zsh)"
export GPG_TTY=$(tty)

# end key;
# Home key
# or you can bind it to the down key "^[[B"
# or you can bind it to Up key "^[[A"
# autosuggest keybindings

# Created by `pipx` on 2024-05-27 19:35:13
export PATH="$PATH:/Users/anderson/.local/bin"
export PATH="$PATH:/Users/anderson/.bin"

eval "$(mise activate zsh)" 

#compdef opencode
###-begin-opencode-completions-###
#
# yargs command completion script
#
# Installation: opencode completion >> ~/.zshrc
#    or opencode completion >> ~/.zprofile on OSX.
#
_opencode_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" opencode --get-yargs-completions "${words[@]}"))
  IFS=$si
  if [[ ${#reply} -gt 0 ]]; then
    _describe 'values' reply
  else
    _default
  fi
}
if [[ "'${zsh_eval_context[-1]}" == "loadautofunc" ]]; then
  _opencode_yargs_completions "$@"
else
  compdef _opencode_yargs_completions opencode
fi
###-end-opencode-completions-###

