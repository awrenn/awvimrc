#!/bin/bash
set -u

function nvimrc() {
  mkdir -p $HOME/.config/nvim/bundle
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  cp vimrc ~/.config/nvim/init.vim
  nvim -c :PlugInstall -c :q -c :q
  #python2.7 $(find $HOME/.config -name install.py | grep YouCompleteMe)
}

function invim() {
  uname -a | grep Ubuntu
  if [ $? -eq 0 ]; then
    sudo add-apt-repository ppa:neovim-ppa/stable
    sudo apt-get update
    sudo apt-get install -y neovim \
      npm \
      nodejs
  fi
  uname -a | grep el7
  if [ $? -eq 0 ]; then
    sudo yum install -y neovim \
      npm \
      nodejs
  fi
  uname -a | grep raspberrypi
  if [ $? -eq 0 ]; then
    sudo apt update
    sudo apt install -y vim \
      npm \
      nodejs
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp vimrc ~/.vimrc
    vim -c :PlugInstall -c :q -c :q
    return
  fi
  uname -a | grep Arch
  if [ $? -eq 0 ]; then
    sudo pacman -S neovim \
      npm \
      nodejs
  fi
  which nvim
  if [ $? -ne 0 ]; then
    return
  fi

  sudo rm -rf /usr/bin/vim
  sudo ln -s $(which nvim) /usr/bin/vim
}

function byobu() {
  cp tmux.conf $HOME/.byobu/.tmux.conf
  cp color.tmux $HOME/.byobu/color.tmux
}

function zsh() {
  sudo apt update
  sudo apt install zsh -y
  ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
  wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O /tmp/oh-my-zsh.sh
  echo exit | sh "/tmp/oh-my-zsh.sh"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
  cp ./af-magic.zsh-theme $HOME/.oh-my-zsh/themes
  cp ./zshrc $HOME/.zshrc
  sudo chsh -s $(which zsh) $(whoami)
}

function gnome() {
  profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
  profile=${profile:1:-1} # remove leading and trailing single quotes
  echo ${profile}
  gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/" background-color '#00001a'
  gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:${profile}/" foreground-color '#ffffcc'
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

function i3() {
  mkdir -p $HOME/.config/i3
  cp i3 $HOME/.config/i3/config
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
  nvim*)
    invim
    ;;
  i3*)
    i3
    ;;
  all*)
    nvimrc
    tmux
    zsh
    ;;
esac
