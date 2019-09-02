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
