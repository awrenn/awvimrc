#!/bin/bash

function vimrc {
    cp vimrc $HOME/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
    vim -c :PluginInstall -c :q -c :q
    python2 $(find $HOME/.vim -name install.py | grep YouCompleteMe)
}

function byobu {
    cp tmux.conf $HOME/.byobu/.tmux.conf
    cp color.tmux $HOME/.byobu/color.tmux
}

function zsh {
    wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O /tmp/oh_my_zsh.sh
    sh "/tmp/oh_my_zsh.sh"
    cp zshrc $HOME/.zshrc
}

function gnome {
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    profile=${profile:1:-1} # remove leading and trailing single quotes
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color '#00001a'
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color '#ffffcc'
}

function tmux {
    cp tmux.conf ~/.tmuf.config
    tmux source-file ~/.tmux.config
}

case $1 in
    vimrc*)
        vimrc
    ;;
    byobu*)
        byobu
    ;;
    zsh*)
        zsh
    ;;
    gnome*)
        gnome
    ;;
    tmux*)
        tmux
    ;;
    all*)
        vimrc
        byobu
        zsh
        gnome
    ;;
esac

