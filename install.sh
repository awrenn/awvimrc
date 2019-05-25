#!/bin/bash

function vimrc {
    cp vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -c :PluginInstall -c :q -c :q
    python2 $(find ~/.vim/plugins -name install.py | grep YouCompleteMe)
}

function byobu {
    cp tmux.conf ~/.byobu/.tmux.conf
    cp color.tmux ~/.byobu/color.tmux
}

function zsh {
    wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O /tmp/oh_my_zsh.sh
    sh "/tmp/oh_my_zsh.sh"
    cp zshrc ~/.zshrc
}

function gnome {
    profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
    profile=${profile:1:-1} # remove leading and trailing single quotes
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color '#00001a'
    gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color '#ffffcc'
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
    all*)
        vimrc
        byobu
        zsh
    ;;
esac

