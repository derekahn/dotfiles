#!/usr/bin/env bash
set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"

# Colors
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr 0)

log() { echo "${GREEN}🏠: $1${RESET}"; }
warn() { echo "${YELLOW}🏠: $1${RESET}"; }
divider() { echo "---------------------------------------------------------"; }

# Detect architecture
if [[ $(uname -m) == "arm64" ]]; then
    HOMEBREW_PREFIX="/opt/homebrew"
else
    HOMEBREW_PREFIX="/usr/local"
fi

divider
log "Greetings. Preparing to power up and begin diagnostics."
divider

# ==============================================================================
# Homebrew
# ==============================================================================
divider
log "Checking for Homebrew installation."
divider

if command -v brew &>/dev/null; then
    log "Homebrew is installed."
    brew update
    brew upgrade
else
    warn "Installing Homebrew. This may prompt for your password."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add brew to PATH for this session
    eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
fi

# ==============================================================================
# Packages
# ==============================================================================
divider
log "Installing system packages."
divider

packages=(
    # Applications (formulae)
    "boop"
    "iina"

    # File tools
    "bat"
    "duf"
    "lsd"
    "ncdu"
    "p7zip"
    "rm-improved"
    "sd"
    "tealdeer"
    "tokei"

    # File manager
    "joshuto"

    # JSON tools
    "dasel"
    "fx"

    # Git tools
    "git-delta"
    "lazygit"

    # Network tools
    "croc"
    "httpie"

    # Security
    "clamav"

    # Search tools
    "fd"
    "fzf"
    "ripgrep"

    # Go
    "go"
    "dlv"
    "gomodifytags"
    "gotests"
    "staticcheck"

    # Lua
    "gnu-sed"
    "stylua"

    # Node.js
    "volta"
    "prettier"

    # Linters & formatters
    "jsonlint"
    "proselint"
    "shellcheck"
    "shfmt"
    "tree-sitter"
    "yamllint"

    # Terminal
    "neovim"
    "tmux"
    "reattach-to-user-namespace"

    # Shell enhancements
    "atuin"
    "starship"
    "zoxide"
    "zsh-syntax-highlighting"

    # Image tools (for nvim)
    "imagemagick"
    "ghostscript"
)

for pkg in "${packages[@]}"; do
    if brew list "$pkg" &>/dev/null; then
        log "$pkg is already installed."
    else
        log "Installing $pkg..."
        brew install "$pkg" || warn "Failed to install $pkg"
    fi
done

# ==============================================================================
# Casks
# ==============================================================================
divider
log "Installing cask applications."
divider

casks=(
    "arc"
    "ghostty"
    "syntax-highlight"
    "alfred"
    "qlmarkdown"
)

for cask in "${casks[@]}"; do
    if brew list --cask "$cask" &>/dev/null; then
        log "$cask is already installed."
    else
        log "Installing $cask..."
        brew install --cask --no-quarantine "$cask" || warn "Failed to install $cask"
    fi
done

# ==============================================================================
# Fonts
# ==============================================================================
divider
log "Installing system fonts."
divider

fonts=(
    "font-hack-nerd-font"
    "font-jetbrains-mono-nerd-font"
)

for font in "${fonts[@]}"; do
    if brew list --cask "$font" &>/dev/null; then
        log "$font is already installed."
    else
        log "Installing $font..."
        brew install --cask "$font" || warn "Failed to install $font"
    fi
done

# ==============================================================================
# Go setup
# ==============================================================================
divider
log "Setting up Go workspace."
divider

GITHUB_USER="${GITHUB_USER:-$(git config --global user.name 2>/dev/null || echo 'default')}"
GO_WORKSPACE="$HOME/go/src/github.com/$GITHUB_USER"

if [[ ! -d "$GO_WORKSPACE" ]]; then
    log "Creating Go workspace at: $GO_WORKSPACE"
    mkdir -p "$GO_WORKSPACE"
else
    log "Go workspace already exists at: $GO_WORKSPACE"
fi

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Install Go tools
log "Installing Go tools..."
go install golang.org/x/tools/cmd/godoc@latest 2>/dev/null || true
go install github.com/josharian/impl@latest 2>/dev/null || true

# ==============================================================================
# Rust setup
# ==============================================================================
divider
log "Setting up Rust."
divider

if command -v rustup &>/dev/null; then
    log "Rust is already installed. Updating..."
    rustup update
else
    log "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

log "Installing Rust components..."
rustup component add rust-src rustfmt rust-analyzer 2>/dev/null || true

# ==============================================================================
# Zsh plugins
# ==============================================================================
divider
log "Setting up zsh-autosuggestions."
divider

ZSH_AUTOSUGGESTIONS_DIR="$HOME/.zsh/zsh-autosuggestions"
if [[ -d "$ZSH_AUTOSUGGESTIONS_DIR" ]]; then
    log "zsh-autosuggestions already installed. Updating..."
    git -C "$ZSH_AUTOSUGGESTIONS_DIR" pull --quiet
else
    log "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_AUTOSUGGESTIONS_DIR"
fi

# ==============================================================================
# Node.js setup via Volta
# ==============================================================================
divider
log "Setting up Node.js via Volta."
divider

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

if command -v volta &>/dev/null; then
    log "Installing Node.js LTS..."
    volta install node@lts || true
    volta install npm@latest || true
fi

# ==============================================================================
# Done
# ==============================================================================
divider
log "System setup complete. Currently running at 100% power. Enjoy!"
divider
log "Next steps:"
log "  1. Run 'make link' to create symlinks"
log "  2. Restart your terminal or run 'source ~/.zshrc'"
divider

exit 0
