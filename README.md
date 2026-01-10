# dotfiles

A portable development environment for macOS.

## What's Included

### Terminal & Shell
- **Ghostty** - GPU-accelerated terminal emulator
- **Zsh** with Zinit plugin manager
- **Starship** - Cross-shell prompt
- **Atuin** - Magical shell history with sync
- **Zoxide** - Smarter cd command
- **fzf** - Fuzzy finder

### Editor
- **Neovim** with LazyVim configuration
- **LunarVim** config also available

### Development Tools
- **Go** with workspace setup and tools (godoc, impl, staticcheck)
- **Rust** via rustup with rust-analyzer
- **Node.js** via Volta
- **Lua** tooling (stylua)

### CLI Tools
| Category | Tools |
|----------|-------|
| File | bat, lsd, fd, ripgrep, ncdu, duf, tokei |
| Git | lazygit, git-delta |
| JSON | fx, dasel |
| Network | httpie, croc |
| File Manager | joshuto |

### Applications (via Homebrew Cask)
- Arc browser
- Alfred
- Syntax Highlight (Quick Look)
- QLMarkdown

## Quick Start

```bash
# Clone the repository
git clone https://github.com/derekahn/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# One-click setup (installs everything and creates symlinks)
make setup
```

## Makefile Commands

```
make setup       # One-click setup - installs everything and creates symlinks
make install     # Installs Homebrew, packages, languages (Go, Rust, Node)
make link        # Creates symlinks for configs (tmux, nvim, zsh, etc)
make link-force  # Creates symlinks, replacing existing files
make update      # Updates Homebrew packages and plugins
make clean       # Removes broken symlinks in ~ and ~/.config
make lint        # Runs shellcheck on scripts
```

## Directory Structure

```
~/.dotfiles
├── bin/
│   ├── install.sh    # Package installation script
│   └── link.sh       # Symlink creation script
├── config/
│   ├── ghostty/      # Ghostty terminal config
│   ├── git/          # Git configuration
│   ├── lazygit/      # Lazygit configuration
│   ├── lsd/          # lsd (ls replacement) config
│   ├── lvim/         # LunarVim configuration
│   ├── nvim/         # Neovim/LazyVim configuration
│   └── starship/     # Starship prompt config
├── tmux/
│   └── tmux.conf.symlink
├── zsh/
│   ├── zshrc.symlink # Main zsh configuration
│   ├── docker.zsh    # Docker aliases
│   ├── git.zsh       # Git aliases
│   ├── go.zsh        # Go configuration
│   ├── k8s.zsh       # Kubernetes aliases
│   ├── node.zsh      # Node.js configuration
│   ├── python.zsh    # Python configuration
│   ├── rust.zsh      # Rust configuration
│   └── ...           # More shell modules
└── Makefile
```

## Environment Variables

Set these before running `make setup` for non-interactive installation:

```bash
export GIT_USER_NAME="your-username"
export GIT_USER_EMAIL="your-email@example.com"
```

## Post-Installation

1. Restart your terminal or run `source ~/.zshrc`
2. In tmux, press `prefix + I` to install plugins
3. Open `nvim` to let LazyVim install plugins automatically

## Updating

```bash
cd ~/.dotfiles
make update
```

This updates Homebrew packages, zsh-autosuggestions, and tmux plugins.
