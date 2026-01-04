.PHONY: all vimrc nvimrc nvim byobu zsh gnome tmux itmux xmonad i3 conky fish ifish fishrc terminator iterminator terminatorrc brew ibrew help

# Default target
all: nvimrc tmux zsh i3 conky

help:
	@echo "Available targets:"
	@echo "  all          - Install nvimrc, tmux, zsh, i3, and conky"
	@echo "  nvimrc       - Setup neovim configuration"
	@echo "  nvim         - Install neovim"
	@echo "  vimrc        - Setup vim configuration"
	@echo "  byobu        - Setup byobu configuration"
	@echo "  zsh          - Install and setup zsh with oh-my-zsh"
	@echo "  gnome        - Configure gnome terminal colors"
	@echo "  tmux         - Install and setup tmux"
	@echo "  xmonad       - Setup xmonad configuration"
	@echo "  i3           - Setup i3 window manager configuration"
	@echo "  conky        - Setup conky configuration"
	@echo "  fish         - Install and setup fish shell"
	@echo "  terminator   - Setup terminator configuration"
	@echo "  brew         - Install homebrew (macOS only)"

# Neovim configuration
nvimrc:
	@echo "Setting up neovim configuration..."
	mkdir -p $(HOME)/.config/nvim/bundle
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp vimrc ~/.config/nvim/init.vim
	nvim -c :PlugInstall -c :q -c :q
	nvim -c :CocInstall coc-go -c :q -c :q
	nvim -c :GoInstallBinaries -c :q -c :q

# Install neovim
nvim:
	@echo "Installing neovim..."
	@if uname -a | grep -q Ubuntu; then \
		sudo add-apt-repository ppa:neovim-ppa/unstable; \
		sudo apt-get update; \
		sudo apt-get install -y neovim; \
	elif uname -a | grep -q el7; then \
		sudo yum install -y neovim npm nodejs; \
	elif uname -a | grep -q Darwin; then \
		brew install neovim; \
	elif uname -a | grep -q raspberrypi; then \
		sudo apt update; \
		sudo apt install -y vim npm nodejs; \
		curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; \
		cp vimrc ~/.vimrc; \
		vim -c :PlugInstall -c :q -c :q; \
		exit 0; \
	elif uname -a | grep -q Arch; then \
		sudo pacman -S neovim npm nodejs; \
	fi
	@if which nvim > /dev/null 2>&1; then \
		sudo rm -rf /usr/bin/vim; \
		sudo ln -s $$(which nvim) /usr/bin/vim; \
	fi

# Vim configuration (for systems without neovim)
vimrc:
	@echo "Setting up vim configuration..."
	@echo "TBD - vimrc"

# Byobu configuration
byobu:
	@echo "Setting up byobu configuration..."
	cp tmux.conf $(HOME)/.byobu/.tmux.conf
	cp color.tmux $(HOME)/.byobu/color.tmux

# Zsh installation and configuration
zsh:
	@echo "Installing and configuring zsh..."
	sudo apt update
	sudo apt install zsh -y
	curl https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > /tmp/oh-my-zsh.sh
	echo exit | sh "/tmp/oh-my-zsh.sh"
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(HOME)/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || true
	git clone https://github.com/zsh-users/zsh-autosuggestions $(HOME)/.oh-my-zsh/custom/plugins/zsh-autosuggestions || true
	cp ./af-magic.zsh-theme $(HOME)/.oh-my-zsh/themes
	cp ./zshrc $(HOME)/.zshrc
	sudo chsh -s $$(which zsh) $$(whoami)

# Gnome terminal configuration
gnome:
	@echo "Configuring gnome terminal..."
	$(eval PROFILE := $(shell gsettings get org.gnome.Terminal.ProfilesList default | sed "s/'//g"))
	@echo "Profile: $(PROFILE)"
	gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(PROFILE)/" background-color '#00001a'
	gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(PROFILE)/" foreground-color '#ffffcc'

# Install tmux
itmux:
	@echo "Installing tmux..."
	@if uname -a | grep -q Darwin; then \
		brew install tmux; \
	fi

# Tmux configuration
tmux: itmux
	@echo "Setting up tmux configuration..."
	cp tmux.conf ~/.tmux.conf

# Xmonad configuration
xmonad:
	@echo "Setting up xmonad configuration..."
	cp -r ./xmonad/* ~/.xmonad
	@echo "Note: Run 'xmonad --recompile' manually if needed"

# i3 window manager configuration
i3:
	@echo "Setting up i3 configuration..."
	mkdir -p $(HOME)/.config/i3
	cp i3 $(HOME)/.config/i3/config

# Conky configuration
conky:
	@echo "Setting up conky configuration..."
	mkdir -p $(HOME)/.config/conky
	cp conkyrc $(HOME)/.config/conky/conkyrc

# Install fish shell
ifish:
	@echo "Installing fish shell..."
	sudo apt update
	sudo apt install fish -y

# Fish shell configuration
fishrc:
	@echo "Setting up fish configuration..."
	curl -L https://get.oh-my.fish | fish
	@echo "TBD - fishrc"

# Fish shell installation and configuration
fish: ifish fishrc

# Install terminator
iterminator:
	@echo "Installing terminator..."
	sudo apt update
	sudo apt install terminator -y

# Terminator configuration
terminatorrc:
	@echo "Setting up terminator configuration..."
	mkdir -p ~/.config/terminator
	cp ./terminator ~/.config/terminator/config
	curl -L https://pcaro.es/d/otf-hermit-2.0.tar.gz > /tmp/hermit.tar.gz
	$(eval TMP := $(shell mktemp -d))
	tar xzf /tmp/hermit.tar.gz -C $(TMP)

# Terminator installation and configuration
terminator: terminatorrc

# Install homebrew (macOS only)
ibrew:
	@echo "Installing homebrew..."
	@if uname -a | grep -q Darwin; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	else \
		echo "Homebrew is only available on macOS"; \
	fi

# Alias for homebrew
brew: ibrew

# Pacman configuration (Arch Linux)
pacman:
	@echo "Installing packages with pacman..."
	pacman -S networkmanager plasma zsh git

