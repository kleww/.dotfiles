# For OSX system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Prompt
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
  export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

  # ls aliases
  alias ls='ls -GF'
  alias ll='ls -alFh'
  alias la='ls -A'
  alias l=' ls -CF'

  # Set default editor to vim
  export VISUAL=vim
  export EDITOR="$VISUAL"

  # Homebrew
  export PATH="/usr/local/bin:$PATH"

fi
