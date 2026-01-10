#!/usr/bin/env bash
set -e

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"
FORCE="${FORCE:-false}"

# Colors
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
RED=$(tput setaf 1)
RESET=$(tput sgr 0)

log() { echo "${GREEN}🏠: $1${RESET}"; }
warn() { echo "${YELLOW}🏠: $1${RESET}"; }
error() { echo "${RED}🏠: $1${RESET}"; }
divider() { echo "---------------------------------------------------------"; }

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--force)
            FORCE=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

# Helper to create symlink
create_symlink() {
    local source="$1"
    local target="$2"

    if [[ -L "$target" ]]; then
        if [[ "$FORCE" == "true" ]]; then
            log "Replacing existing symlink: $target"
            rm -f "$target"
            ln -s "$source" "$target"
        else
            warn "Symlink already exists: $target (use --force to replace)"
        fi
    elif [[ -e "$target" ]]; then
        if [[ "$FORCE" == "true" ]]; then
            log "Backing up and replacing: $target -> ${target}.backup"
            mv "$target" "${target}.backup"
            ln -s "$source" "$target"
        else
            warn "File exists (not a symlink): $target (use --force to replace)"
        fi
    else
        log "Creating symlink: $target -> $source"
        ln -s "$source" "$target"
    fi
}

divider
log "Linking dotfiles from $DOTFILES_DIR"
divider

# ==============================================================================
# Symlink files (*.symlink -> ~/.<name>)
# ==============================================================================
divider
log "Linking *.symlink files to home directory."
divider

while IFS= read -r -d '' file; do
    filename=$(basename "$file" '.symlink')
    target="$HOME/.$filename"
    create_symlink "$file" "$target"
done < <(find -H "$DOTFILES_DIR" -maxdepth 3 -name '*.symlink' -print0)

# ==============================================================================
# Config directory (~/.config)
# ==============================================================================
divider
log "Linking config directories to ~/.config"
divider

# Ensure ~/.config exists
mkdir -p "$HOME/.config"

# Link each config directory
for config in "$DOTFILES_DIR/config/"*; do
    if [[ -d "$config" ]]; then
        config_name=$(basename "$config")
        target="$HOME/.config/$config_name"
        create_symlink "$config" "$target"
    fi
done

# ==============================================================================
# Git config (interactive or from environment)
# ==============================================================================
divider
log "Configuring git."
divider

# Get current values
current_name=$(git config --global user.name 2>/dev/null || echo "")
current_email=$(git config --global user.email 2>/dev/null || echo "")

# Git username
if [[ -n "$GIT_USER_NAME" ]]; then
    git config --global user.name "$GIT_USER_NAME"
    log "Set git user.name from environment: $GIT_USER_NAME"
elif [[ -z "$current_name" ]]; then
    echo -n "Enter your git username (e.g., derekahn): "
    read -r git_name
    if [[ -n "$git_name" ]]; then
        git config --global user.name "$git_name"
        log "Set git user.name: $git_name"
    fi
else
    log "Git user.name already set: $current_name"
fi

# Git email
if [[ -n "$GIT_USER_EMAIL" ]]; then
    git config --global user.email "$GIT_USER_EMAIL"
    log "Set git user.email from environment: $GIT_USER_EMAIL"
elif [[ -z "$current_email" ]]; then
    echo -n "Enter your git email (e.g., email@example.com): "
    read -r git_email
    if [[ -n "$git_email" ]]; then
        git config --global user.email "$git_email"
        log "Set git user.email: $git_email"
    fi
else
    log "Git user.email already set: $current_email"
fi

# ==============================================================================
# Tmux
# ==============================================================================
divider
log "Setting up tmux."
divider

if [[ -f "$HOME/.tmux.conf" ]]; then
    # Only source if tmux server is running
    if tmux list-sessions &>/dev/null; then
        log "Reloading tmux configuration..."
        tmux source-file "$HOME/.tmux.conf" 2>/dev/null || warn "Could not reload tmux config"
    else
        log "Tmux not running. Config will be loaded on next tmux start."
    fi
else
    warn "No ~/.tmux.conf found"
fi

# ==============================================================================
# TPM (Tmux Plugin Manager)
# ==============================================================================
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [[ ! -d "$TPM_DIR" ]]; then
    log "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    log "TPM already installed."
fi

# ==============================================================================
# Done
# ==============================================================================
divider
log "Linking complete!"
divider
log "Tips:"
log "  - Restart your terminal or run 'source ~/.zshrc'"
log "  - In tmux, press 'prefix + I' to install plugins"
log "  - Run 'nvim' to let LazyVim install plugins"
divider

exit 0
