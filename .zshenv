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

# Was jre before, but became jbr # Get rid of Fastlane noise
export FASTLANE_SKIP_UPDATE_CHECK=1
export FASTLANE_HIDE_CHANGELOG=1
export FASTLANE_HIDE_PLUGINS_TABLE=1
export FASTLANE_SKIP_ACTION_SUMMARY=1
# This is useful only if your work in the Automattic Mobile Platform team ^-^'
#
# See
# https://github.com/wordpress-mobile/release-toolkit/blob/984a1854b42641daf43b29aa7ae36d0961be8f59/lib/fastlane/plugin/wpmreleasetoolkit/helper/interactive_prompt_reminder.rb#L10-L18
export FASTLANE_PROMPT_REMINDER_MESSAGE=1

# Java Path 
export JAVA_HOME=/Contents/Home
export XDG_CONFIG_HOME=/Users/anderson/.config
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

# Use your LiteLLM API 
export ANTHROPIC_BASE_URL="http://10.10.10.10:8317/"
# export ANTHROPIC_API_KEY="your-api-key"
# export ANTHROPIC_AUTH_TOKEN="your-api-key"
# export OPENAI_API_KEY="your-api-key"

# version 2.x.x
export ANTHROPIC_DEFAULT_OPUS_MODEL=gemini-2.5-pro
export ANTHROPIC_DEFAULT_SONNET_MODEL=gemini-2.5-flash
export ANTHROPIC_DEFAULT_HAIKU_MODEL=gemini-2.5-flash-lite
# version 1.x.x
export ANTHROPIC_MODEL=gemini-2.5-pro
export ANTHROPIC_SMALL_FAST_MODEL=gemini-2.5-flash

# export OPENAI_BASE_URL="http://10.10.10.10:4000"
# export GOOGLE_GEMINI_BASE_URL="http://10.10.10.10:4000"
# export GEMINI_API_KEY="your-api-key"
export HOMEBREW_NO_AUTO_UPDATE=1
