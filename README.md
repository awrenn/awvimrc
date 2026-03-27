# awvimrc - Personal Development Environment Configuration

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS-blue.svg)]()
[![Made with Vim](https://img.shields.io/badge/Made%20with-Vim-1f425f.svg)](https://www.vim.org/)

A comprehensive dotfiles repository for setting up a consistent development environment across different systems. This repository includes configurations for Neovim, tmux, zsh, i3, and various other tools.

## 📚 Documentation

- **[Quick Start Guide](QUICKSTART.md)** - Get started in minutes
- **[Contributing](CONTRIBUTING.md)** - How to contribute
- **[Changelog](CHANGELOG.md)** - What's new

## 🚀 Features

- **Neovim/Vim Configuration**: Modern Neovim setup with plugins for multiple languages
  - Language support: Rust, Go, TypeScript/TSX, Elixir, Ruby, Dart, and more
  - Integrated LSP via CoC (Conquer of Completion)
  - AI-powered coding assistant with Avante.nvim
  - File navigation with Telescope and NERDTree
  - Gruvbox color scheme with customizations

- **Terminal Multiplexer**: Tmux configuration with custom key bindings and powerline theme
  - Custom prefix key (Ctrl+A)
  - Function key shortcuts (F2-F7)
  - Yellow powerline theme

- **Shell Configuration**:
  - Zsh with Oh-My-Zsh
  - Custom af-magic theme
  - Syntax highlighting and autosuggestions
  - Vi mode key bindings

- **Window Managers**:
  - i3 window manager configuration
  - XMonad configuration
  - Conky system monitor

- **Additional Tools**:
  - Terminator terminal emulator config
  - Gnome terminal color scheme
  - Fish shell support
  - Byobu configuration

## 📋 Prerequisites

Depending on what you want to install, you may need:

- Git
- curl
- A supported OS: Ubuntu, macOS (Darwin), Arch Linux, or Raspberry Pi OS
- sudo privileges for system-wide installations

## 🔧 Installation

### Quick Start

Install everything with the default configuration:

```bash
make all
```

This will install and configure: nvimrc, tmux, zsh, i3, and conky.

### Individual Component Installation

Install specific components:

```bash
# Show all available targets
make help

# Install Neovim configuration
make nvimrc

# Install Neovim itself
make nvim

# Install and configure Zsh
make zsh

# Install and configure tmux
make tmux

# Configure i3 window manager
make i3

# Configure Conky
make conky

# Install Fish shell
make fish

# Configure Terminator
make terminator

# Install Homebrew (macOS only)
make brew
```

## 📁 Repository Structure

```
.
├── Makefile                    # Installation automation
├── install.sh                  # Legacy bash installation script
├── vimrc                       # Neovim/Vim configuration
├── coc-settings.json          # CoC LSP settings
├── tmux.conf                  # Tmux configuration
├── color.tmux                 # Tmux color scheme
├── zshrc                      # Zsh configuration
├── af-magic.zsh-theme         # Custom Zsh theme
├── i3                         # i3 window manager config
├── conkyrc                    # Conky configuration
├── terminator                 # Terminator terminal config
├── Xresources                 # X11 resources
├── xmonad/                    # XMonad configuration
│   └── xmonad.hs
└── 01-network-manager-all.yaml # Network manager config
```

## 🎨 Neovim Features

### Plugins Included

- **File Navigation**: NERDTree, Telescope
- **Language Support**:
  - Rust (rust.vim)
  - Go (vim-go)
  - TypeScript/TSX (typescript-vim, vim-jsx-typescript)
  - Elixir (vim-elixir, vim-mix-format)
  - Ruby (rufo-vim)
  - Dart (dart-vim-plugin)
  - Puppet (vim-puppet)
  - Mustache/Handlebars (vim-mustache-handlebars)
  - Godot (vim-godot)
- **LSP & Completion**: CoC.nvim
- **AI Assistant**: Avante.nvim with dependencies
- **Code Formatting**: vim-codefmt (Google)
- **UI Enhancements**:
  - vim-airline (status bar)
  - indentLine (visual indent guides)
  - gruvbox (color scheme)
- **Text Manipulation**:
  - vim-surround
  - vim-repeat
  - vim-speeddating

### Key Bindings

- `Ctrl+O`: Toggle NERDTree
- `Ctrl+C`: Format code (context-aware)
- `Ctrl+N`: Toggle line numbers
- `Ctrl+J`: Split window vertically
- `Ctrl+H/L`: Navigate between windows
- `T`: Open terminal in split
- `<leader>ff`: Telescope find files
- `<leader>fg`: Telescope live grep
- `<leader>fb`: Telescope buffers
- `<leader>fh`: Telescope help tags

Language-specific:
- **Rust**: `Ctrl+C` (format), `Ctrl+T` (run tests), `Space` (fold toggle)
- **Go**: `Ctrl+T` (run tests)
- **Elixir**: `Ctrl+C` (MixFormat)
- **Ruby**: `Ctrl+C` (Rufo format)

## 🔑 Tmux Key Bindings

- **Prefix**: `Ctrl+A` (instead of default Ctrl+B)
- `F2`: New window
- `F3`: Previous window
- `F4`: Next window
- `F7`: Copy mode
- `Ctrl+A r`: Reload configuration

## 🐚 Shell Features

### Zsh
- Vi mode key bindings
- Syntax highlighting
- Auto-suggestions
- Git integration
- Custom directory colors (cyan instead of blue)
- PATH includes: cargo, go, flutter, snap, krew

## 🛠️ Customization

All configuration files can be modified before installation:

1. Clone the repository
2. Edit the configuration files as needed
3. Run `make <target>` to install

### Backup Existing Configs

Before installing, consider backing up your existing configurations:

```bash
make backup  # Creates backups of existing configs
```

## 🔄 Updating

To update configurations after modifying files in this repository:

```bash
# Re-run the installation for specific components
make nvimrc  # Update Neovim config
make tmux    # Update tmux config
make zsh     # Update zsh config
```

## 🧹 Uninstallation

To remove configurations (creates backups before removal):

```bash
make uninstall
```

## 🐛 Troubleshooting

### Neovim plugins not loading
```bash
# Manually run PlugInstall
nvim -c :PlugInstall -c :q -c :q
```

### CoC not working
```bash
# Install language servers manually
nvim -c ":CocInstall coc-go coc-rust-analyzer coc-tsserver" -c :q
```

### Tmux colors not working
Ensure your terminal supports 256 colors:
```bash
echo $TERM  # Should show something like "xterm-256color"
```

### Zsh not set as default shell
```bash
chsh -s $(which zsh)
```

## 📝 Platform-Specific Notes

### Ubuntu/Debian
- Uses `apt` package manager
- Neovim installed from PPA

### macOS
- Requires Homebrew
- Use `make brew` to install Homebrew first

### Arch Linux
- Uses `pacman` package manager

### Raspberry Pi
- Falls back to regular Vim if Neovim is unavailable

## 🤝 Contributing

Feel free to fork this repository and customize it for your own use. If you have improvements or bug fixes, pull requests are welcome!

## 📄 License

MIT License - See LICENSE file for details

## 🙏 Acknowledgments

- [Neovim](https://neovim.io/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Tmux](https://github.com/tmux/tmux)
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [CoC.nvim](https://github.com/neoclide/coc.nvim)
- [Avante.nvim](https://github.com/yetone/avante.nvim)
- All plugin authors mentioned in the configuration

## 📧 Contact

For questions or issues, please open an issue on GitHub.

---

**Note**: This is a personal configuration repository. Review all scripts and configurations before running them on your system.

