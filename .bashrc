# For linux system
if [[ "$OSTYPE" == "linux-gnu" ]]; then

  # If not running interactively, don't do anything
  case $- in
    *i*) ;;
    *) return;;
  esac

  # Don't put duplicate lines or lines starting with space in the history.
  HISTCONTROL=ignoreboth

  # Setting history length
  HISTSIZE=1000
  HISTFILESIZE=2000

  # Check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  # Make less more friendly for non-text input files
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

  # Enable programmable completion features
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi

  # Set terminal in 256 colors
  export TERM=xterm-256color

  # Prompt
  export PS1="\u@\h:\w\$ "

  # ls aliases
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'

  # git aliases
  alias gl='git log --oneline --abbrev-commit --graph --decorate --color'

  # Set default editor to vim
  export VISUAL=vim
  export EDITOR="$VISUAL"

# For OSX system
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Prompt
  export PS1="\u@\h:\w\$ "

  # ls aliases
  alias ls='ls -GF'
  alias ll='ls -alFh'
  alias la='ls -A'
  alias l=' ls -CF'

  # Set default editor to vim
  export VISUAL=vim
  export EDITOR="$VISUAL"

fi
