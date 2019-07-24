#!/bin/bash
set -u

function nvimrc() {
  mkdir -p $HOME/.config/nvim/bundle
   curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  cp vimrc ~/.config/nvim/init.vim
  nvim -c :PlugInstall -c :q -c :q
  python2.7 $(find $HOME/.vim -name install.py | grep YouCompleteMe)
}

function byobu() {
  cp tmux.conf $HOME/.byobu/.tmux.conf
  cp color.tmux $HOME/.byobu/color.tmux
}

function zsh() {
  ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
  wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O /tmp/oh_my_zsh.sh
  echo "exit" | sh "/tmp/oh_my_zsh.sh"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions

  cp ./zshrc $HOME/.zshrc
}

function gnome() {
  profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
  profile=${profile:1:-1} # remove leading and trailing single quotes
  gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color '#00001a'
  gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color '#ffffcc'
}

function tmux() {
  cp tmux.conf ~/.tmux.conf
}

function xmonad() {
  cp -r ./xmonad/* ~/.xmonad
  ##xmonad --recompile
}

function pacman() {
  pacman -S networkmanager plasma zsh git
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
  xmonad*)
    xmonad
    ;;
  nvimrc*)
    nvimrc
    ;;
  all*)
    nvimrc
    tmux
    gnome
    xorg
    zsh
    ;;
esac
