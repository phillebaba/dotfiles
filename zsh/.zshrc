export ZSH=/usr/share/oh-my-zsh
export ZSH_CACHE_DIR=~/.cache/oh-my-zsh
mkdir -p $ZSH_CACHE_DIR

ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git virtualenv virtualenvwrapper terraform docker aws kubectl pass)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# User Configuration
export POWERLEVEL9K_MODE='nerdfont-complete'
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

## Go
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH:$GOBIN

# Python
export PATH="$PATH:/home/philip/.local/bin"

# Krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Kubebuilder
export PATH=$PATH:/usr/local/kubebuilder/bin

# Aliases
alias vim="nvim"
eval $(thefuck --alias)

# Functions
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;} # Fetch .gitingore files easily from gitignore.io

# Pywal Colors
cat ~/.cache/wal/sequences
