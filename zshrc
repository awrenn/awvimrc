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
export PATH="/home/acwrenn/go/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:/snap/bin
export PATH=/usr/local/go/bin:$PATH
export GOPRIVATE="gitlab.devtools.intel.com"
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add $HOME/.ssh/acwrenn_rsa;
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
unalias gg
