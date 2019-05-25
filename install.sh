#!/bin/bash

function vimrc {
    cp vimrc ~/.vimrc
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -c :PluginInstall -c :q -c :q
    python2 $(find ~/.vim/plugins -name install.py | grep YouCompleteMe)
}

function byobu {
    cp tmux.conf ~/.byobu/.tmux.conf
}

function zsh {
    wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O /tmp/oh_my_zsh.sh
    zsh -c /tmp/oh_my_zsh.sh
    cp zshrc ~/.zshrc
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
    all*)
        vimrc
        byobu
        zsh
    ;;
esac

