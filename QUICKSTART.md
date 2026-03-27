# Quick Start Guide

Get up and running with awvimrc in minutes!

## Prerequisites

Before you begin, ensure you have:
- Git installed
- sudo privileges (for system-wide installations)
- Internet connection (for downloading plugins and dependencies)

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/awvimrc.git
cd awvimrc
```

### 2. Backup Your Existing Configurations (Optional but Recommended)

```bash
make backup
```

This creates a timestamped backup directory in `~/.config-backup-YYYYMMDD-HHMMSS/`

### 3. Choose Your Installation

#### Option A: Install Everything (Recommended for new setups)

```bash
make all
```

This installs: Neovim configuration, tmux, zsh, i3, and conky.

#### Option B: Install Individual Components

```bash
# Just Neovim configuration
make nvimrc

# Just tmux
make tmux

# Just zsh
make zsh

# See all options
make help
```

### 4. Verify Installation

```bash
make check
```

This shows which configurations are currently installed.

## First Time Setup

### After Installing Neovim

1. Open Neovim:
   ```bash
   nvim
   ```

2. Wait for plugins to finish installing (happens automatically on first run)

3. If you see errors, run:
   ```bash
   :PlugInstall
   :CocInstall coc-go coc-rust-analyzer coc-tsserver
   ```

### After Installing Zsh

1. Log out and log back in (or run `zsh`)
2. Your default shell should now be zsh with Oh-My-Zsh

### After Installing Tmux

1. Start tmux:
   ```bash
   tmux
   ```

2. Remember: The prefix key is `Ctrl+A` (not the default `Ctrl+B`)

## Common Commands

```bash
make help           # Show all available commands
make backup         # Backup existing configs
make check          # Check what's installed
make nvimrc         # Setup/update Neovim
make tmux           # Setup/update tmux
make zsh            # Setup/update zsh
make uninstall      # Remove all configs (creates backup first)
```

## Quick Reference

### Neovim Key Bindings
- `Ctrl+O` - Toggle file tree (NERDTree)
- `Ctrl+C` - Format code
- `Ctrl+N` - Toggle line numbers
- `<leader>ff` - Find files (Telescope)
- `<leader>fg` - Search in files (Telescope grep)

### Tmux Key Bindings
- `Ctrl+A` - Prefix key
- `F2` - New window
- `F3/F4` - Previous/Next window
- `F7` - Copy mode
- `Ctrl+A r` - Reload config

## Troubleshooting

### Neovim plugins not loading
```bash
nvim -c :PlugInstall -c :q -c :q
```

### Zsh not default shell
```bash
chsh -s $(which zsh)
```

### Tmux colors look wrong
Check your terminal supports 256 colors:
```bash
echo $TERM  # Should show "xterm-256color" or similar
```

## Next Steps

1. Read the full [README.md](README.md) for detailed documentation
2. Customize configurations to your liking
3. Check out [CONTRIBUTING.md](CONTRIBUTING.md) if you want to contribute

## Getting Help

- Check the [README.md](README.md) for detailed information
- Look at existing configurations in the repository
- Open an issue on GitHub for bugs or questions

## Platform-Specific Notes

### Ubuntu/Debian
Everything should work out of the box with `apt` package manager.

### macOS
Install Homebrew first:
```bash
make brew
```

### Arch Linux
Uses `pacman` package manager. Most targets should work.

### Raspberry Pi
Falls back to regular Vim if Neovim is unavailable.

---

**Pro Tip**: Start with `make nvimrc` and `make tmux` for the best immediate productivity boost!

