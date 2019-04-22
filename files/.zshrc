# Path to your oh-my-zsh installation.
export ZSH="/home/philip/.oh-my-zsh"

ZSH_THEME="robbyrussell"
DISABLE_AUTO_TITLE="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git terraform docker aws kubectl pass)

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration
export POWERLEVEL9K_MODE='nerdfont-complete'
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

## Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Aliases
alias vim="nvim"

# Functions
function gi() { curl -sLw n https://www.gitignore.io/api/$@ ;} # Fetch .gitingore files easily from gitignore.io
