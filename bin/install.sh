#!/usr/bin/env bash
set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"

# Colors
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
BOLD=$(tput bold)
RESET=$(tput sgr 0)

log() { echo "${GREEN}🏠: $1${RESET}"; }
warn() { echo "${YELLOW}🏠: $1${RESET}"; }
error() { echo "${RED}🏠: $1${RESET}"; }
step() {
  echo
  echo "${BOLD}${GREEN}[$1/$TOTAL_STEPS] $2${RESET}"
  echo "---------------------------------------------------------"
}

TOTAL_STEPS=8

# ==============================================================================
# Help
# ==============================================================================
usage() {
  cat <<EOF
Usage: install.sh [OPTIONS]

Installs Homebrew, system packages, languages (Go, Rust, Node), and shell plugins.

Options:
  -h, --help    Show this help message
  -s, --skip    Comma-separated list of steps to skip
                Steps: homebrew,packages,casks,fonts,go,rust,zsh,node

Examples:
  ./install.sh                    # Full install
  ./install.sh --skip rust,node   # Skip Rust and Node.js setup

Environment Variables:
  DOTFILES_DIR    Override dotfiles location (default: ~/.dotfiles)
  GITHUB_USER     GitHub username for Go workspace
EOF
  exit 0
}

# Parse arguments
SKIP=""
while [[ $# -gt 0 ]]; do
  case $1 in
  -h | --help) usage ;;
  -s | --skip)
    if [[ $# -lt 2 ]]; then
      error "--skip requires a value (e.g. --skip rust,node)"
      exit 1
    fi
    SKIP="$2"
    shift 2
    ;;
  *) shift ;;
  esac
done

should_skip() { [[ ",$SKIP," == *",$1,"* ]]; }

# ==============================================================================
# Preflight checks
# ==============================================================================
preflight() {
  log "Running preflight checks..."

  # macOS check
  if [[ "$(uname)" != "Darwin" ]]; then
    error "This script is designed for macOS. Detected: $(uname)"
    exit 1
  fi

  # Xcode CLI tools
  if ! xcode-select -p &>/dev/null; then
    warn "Xcode Command Line Tools not found. Installing..."
    xcode-select --install
    echo "Please re-run this script after Xcode CLI tools finish installing."
    exit 1
  fi

  # Disk space (require at least 5GB free)
  local free_gb
  free_gb=$(df -g / | awk 'NR==2 {print $4}')
  if [[ "$free_gb" -lt 5 ]]; then
    error "Low disk space: ${free_gb}GB free. At least 5GB recommended."
    exit 1
  fi

  log "macOS $(sw_vers -productVersion) ($(uname -m))"
  log "Xcode CLI tools: installed"
  log "Disk space: ${free_gb}GB free"
}

preflight

# Detect architecture
if [[ $(uname -m) == "arm64" ]]; then
  HOMEBREW_PREFIX="/opt/homebrew"
else
  HOMEBREW_PREFIX="/usr/local"
fi

# ==============================================================================
# [1/8] Homebrew
# ==============================================================================
if ! should_skip "homebrew"; then
  step 1 "Homebrew"

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
else
  log "Skipping Homebrew"
fi

# ==============================================================================
# [2/8] Packages
# ==============================================================================
if ! should_skip "packages"; then
  step 2 "System packages"

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
    "television"
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
    "epilande/tap/ccmux"

    # Media tools
    "yt-dlp"

    # Shell enhancements
    "atuin"
    "starship"
    "zoxide"
    "zsh-syntax-highlighting"

    # Image tools (for nvim)
    "imagemagick"
    "ghostscript"
  )

  local_installed=0
  local_total=${#packages[@]}
  for pkg in "${packages[@]}"; do
    local_installed=$((local_installed + 1))
    if brew list "$pkg" &>/dev/null; then
      log "($local_installed/$local_total) $pkg already installed"
    else
      log "($local_installed/$local_total) Installing $pkg..."
      brew install "$pkg" || warn "Failed to install $pkg"
    fi
  done
else
  log "Skipping packages"
fi

# ==============================================================================
# [3/8] Casks
# ==============================================================================
if ! should_skip "casks"; then
  step 3 "Desktop applications"

  casks=(
    "arc"
    "ghostty"
    "syntax-highlight"
    "alfred"
    "qlmarkdown"
  )

  for cask in "${casks[@]}"; do
    if brew list --cask "$cask" &>/dev/null; then
      log "$cask already installed"
    else
      log "Installing $cask..."
      brew install --cask --no-quarantine "$cask" || warn "Failed to install $cask"
    fi
  done
else
  log "Skipping casks"
fi

# ==============================================================================
# [4/8] Fonts
# ==============================================================================
if ! should_skip "fonts"; then
  step 4 "Nerd Fonts"

  fonts=(
    "font-hack-nerd-font"
    "font-jetbrains-mono-nerd-font"
  )

  for font in "${fonts[@]}"; do
    if brew list --cask "$font" &>/dev/null; then
      log "$font already installed"
    else
      log "Installing $font..."
      brew install --cask "$font" || warn "Failed to install $font"
    fi
  done
else
  log "Skipping fonts"
fi

# ==============================================================================
# [5/8] Go
# ==============================================================================
if ! should_skip "go"; then
  step 5 "Go tools"

  export GOPATH="$HOME/go"
  export PATH="$PATH:$GOPATH/bin"

  log "Installing Go tools..."
  go install golang.org/x/tools/cmd/godoc@latest 2>/dev/null || true
  go install github.com/josharian/impl@latest 2>/dev/null || true
else
  log "Skipping Go"
fi

# ==============================================================================
# [6/8] Rust
# ==============================================================================
if ! should_skip "rust"; then
  step 6 "Rust toolchain"

  if command -v rustup &>/dev/null; then
    log "Rust is already installed. Updating..."
    rustup update
  else
    log "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    # shellcheck disable=SC1091  # created by rustup at runtime
    source "$HOME/.cargo/env"
  fi

  log "Installing Rust components..."
  rustup component add rust-src rustfmt rust-analyzer 2>/dev/null || true
else
  log "Skipping Rust"
fi

# ==============================================================================
# [7/8] Zsh plugins
# ==============================================================================
if ! should_skip "zsh"; then
  step 7 "Zsh plugins"

  ZSH_AUTOSUGGESTIONS_DIR="$HOME/.zsh/zsh-autosuggestions"
  if [[ -d "$ZSH_AUTOSUGGESTIONS_DIR" ]]; then
    log "zsh-autosuggestions already installed. Updating..."
    git -C "$ZSH_AUTOSUGGESTIONS_DIR" pull --quiet
  else
    log "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_AUTOSUGGESTIONS_DIR"
  fi
else
  log "Skipping Zsh plugins"
fi

# ==============================================================================
# [8/8] Node.js
# ==============================================================================
if ! should_skip "node"; then
  step 8 "Node.js (via Volta)"

  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"

  if command -v volta &>/dev/null; then
    log "Installing Node.js LTS..."
    volta install node@lts || true
    volta install npm@latest || true
  else
    warn "Volta not found. Skipping Node.js setup."
  fi
else
  log "Skipping Node.js"
fi

# ==============================================================================
# Done
# ==============================================================================
echo
echo "---------------------------------------------------------"
log "Setup complete! [$TOTAL_STEPS/$TOTAL_STEPS steps]"
echo "---------------------------------------------------------"
log "Next steps:"
log "  1. Run 'make link' to create symlinks"
log "  2. Restart your terminal or run 'source ~/.zshrc'"
echo "---------------------------------------------------------"

exit 0
