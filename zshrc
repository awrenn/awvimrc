export ZSH="$HOME/.oh-my-zsh"
export TERM="screen-256color"

ZSH_THEME="af-magic"
#ZSH_THEME="muse"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="avit"
#ZSH_THEME="agnoster"

DISABLE_MAGIC_FUNCTIONS=true
# DISABLE_LS_COLORS="true"
#
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    colorize
)

source $ZSH/oh-my-zsh.sh

# The most important command in this file
bindkey -v

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
KEYTIMEOUT=.1
alias emacs="emacs --no-window-system"
eval $(dircolors -p | sed -e 's/DIR 01;34/DIR 01;36/' | dircolors /dev/stdin)
export PATH=$PATH:/snap/bin
export PATH=$PATH:$HOME/.cargo/bin

# Created by `userpath` on 2020-09-09 03:15:13
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$PATH:/usr/lib/go/bin"
export PATH="$PATH:$HOME/Dev/flutter/bin"
export STEAM_COMPAT_DATA_PATH=$HOME/proton
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"
