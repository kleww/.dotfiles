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


# For Linux system
elif [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Prompt
  parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
  }
  export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\
\W\[\033[32m\]\$(parse_git_branch)\[\033[00m\]$ "

  # Set default editor to vim
  export VISUAL=vim
  export EDITOR="$VISUAL"

  # Compiled binaries
  export PATH="$HOME/.bin:$PATH"

  # Golang
  export GOROOT=$HOME/.bin/Cellar/golang/1.8
  export PATH="$PATH:$GOROOT/bin"
  export GOPATH=$HOME/wd/go

  # Docker Machine
  eval $(docker-machine env dev)

  # 256 colors terminal
  export TERM="xterm-256color"
fi
