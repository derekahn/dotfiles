# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Portable macOS dotfiles repository. Manages shell (zsh), editor (Neovim/LazyVim), terminal multiplexer (tmux), and CLI tool configurations through symlinks.

## Commands

```bash
make setup        # Full install + link (one-click)
make install      # Homebrew, packages, languages (Go, Rust, Node)
make link         # Create symlinks (*.symlink -> ~/.<name>, config/* -> ~/.config/*)
make link-force   # Force-replace existing symlinks
make update       # Update Homebrew, zsh-autosuggestions, TPM plugins
make clean        # Remove broken symlinks
make lint         # shellcheck on bin/*.sh
```

Non-interactive install: set `GIT_USER_NAME` and `GIT_USER_EMAIL` env vars before `make setup`.

## Architecture

### Symlink Convention

- `**/*.symlink` files are linked to `~/.<filename>` (without `.symlink` suffix)
- Each directory under `config/` is linked to `~/.config/<dirname>`
- Scripts: `bin/install.sh` (package installation), `bin/link.sh` (symlink creation)

### Zsh Module System

`zsh/zshrc.symlink` sources all `~/.dotfiles/zsh/*.zsh` files. Each `.zsh` file is a self-contained module for a specific tool (git, go, rust, docker, k8s, etc.). Add new tool configs by creating a new `.zsh` file in the `zsh/` directory.

### Neovim (LazyVim)

- Entry point: `config/nvim/init.lua` -> `lua/config/lazy.lua` (bootstraps lazy.nvim)
- Core config: `lua/config/{options,keymaps,autocmds}.lua`
- Plugins: `lua/plugins/*.lua` (each file returns a table of plugin specs)
- Language-specific: `lua/plugins/langs/*.lua`
- Snippets: `config/nvim/snippets/*.lua`
- LazyVim extras are declared in `config/nvim/lazyvim.json`
- Lua formatting: `stylua.toml` at nvim config root

### Tmux

- Config: `tmux/tmux.conf.symlink` -> `~/.tmux.conf`
- Prefix key: `Ctrl+a`
- Plugin manager: TPM (installed automatically by `link.sh`)

### Key Tool Configs

- **Git**: `config/git/config` - uses difftastic as difftool, delta as pager in lazygit
- **Ghostty**: `config/ghostty/config` - Catppuccin Mocha theme, DankMono Nerd Font
- **Starship**: `config/starship/config.toml` - prompt with language indicators
- **Lazygit**: `config/lazygit/config.yml` - Catppuccin theme, delta pager
- **LSD**: `config/lsd/config.yaml` - ls replacement with Nerd Font icons

## Shell Scripts

Scripts in `bin/` use `bash` with `set -e`. Lint with `shellcheck` (`make lint`). The install script handles Homebrew architecture detection (arm64 vs x86).
