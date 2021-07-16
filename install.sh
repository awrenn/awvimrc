#!/bin/bash
set -u

function fishrc() {
  curl -L https://get.oh-my.fish | fish
  echo "TBD - fishrc"
}

function ifish() {
  sudo apt update
  sudo apt install fish -y
}

function terminatorrc() {
  mkdir -p ~/.config/terminator
  cp ./terminator ~/.config/terminator/config
  curl -L https://pcaro.es/d/otf-hermit-2.0.tar.gz > /tmp/hermit.tar.gz
  tmp=$(mktemp -d)
  tar xzf /tmp/hermit.tar.gz -C $tmp
}

function iterminator() {
  sudo apt update
  sudo apt install terminator -y
}

function nvimrc() {
  mkdir -p $HOME/.config/nvim/bundle
  curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  cp vimrc ~/.config/nvim/init.vim
  nvim -c :PlugInstall -c :q -c :q
  #python2.7 $(find $HOME/.config -name install.py | grep YouCompleteMe)
}

function ibrew() {
  uname -a | grep Darwin
  if [ $? -eq 0 ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
}

function invim() {
  uname -a | grep Ubuntu
  if [ $? -eq 0 ]; then
    sudo add-apt-repository ppa:neovim-ppa/unstable
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
  uname -a | grep Darwin
  if [ $? -eq 0 ]; then
      brew install neovim
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
  curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > /tmp/oh-my-zsh.sh
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

function itmux() {
  uname -a | grep Darwin
  if [ $? -eq 0 ]; then
    brew install tmux
  fi
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

function conky() {
  mkdir -p $HOME/.config/conky
  cp conkyrc $HOME/.config/conky/conkyrc
}

case $1 in
  vimrc)
    vimrc
    ;;
  byobu)
    byobu
    ;;
  zsh)
    zsh
    ;;
  gnome)
    gnome
    ;;
  tmux)
    itmux
    tmux
    ;;
  xmonad)
    xmonad
    ;;
  nvimrc)
    nvimrc
    ;;
  nvim)
    invim
    ;;
  i3)
    i3
    ;;
  conky)
    conky
    ;;
  fish)
    ifish
    fishrc
    ;;
  terminator)
    terminatorrc
    ##iterminator
    ;;
  brew)
    ibrew
  ;;
  all)
    nvimrc
    tmux
    zsh
    i3
    conky
    ;;
esac
