#!/usr/bin/env bash
# Verifies the dotfiles setup: configs load, symlinks resolve, tools exist.
set -u

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"

GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr 0)

FAILURES=0
ok() { echo "${GREEN}  ✓ $1${RESET}"; }
fail() {
  echo "${RED}  ✗ $1${RESET}"
  FAILURES=$((FAILURES + 1))
}

echo "zsh"
zsh_ok=true
for f in "$DOTFILES_DIR"/zsh/*.zsh "$DOTFILES_DIR"/zsh/zshrc.symlink; do
  zsh -n "$f" || { fail "syntax error: $f"; zsh_ok=false; }
done
[[ "$zsh_ok" == "true" ]] && ok "all modules parse"

echo "neovim"
if nvim --headless +qa >/dev/null 2>&1; then
  ok "headless boot clean"
else
  fail "nvim config has errors (run: nvim --headless +qa)"
fi

echo "tmux"
if tmux -L doctor -f "$DOTFILES_DIR/tmux/tmux.conf.symlink" new-session -d >/dev/null 2>&1; then
  tmux -L doctor kill-server 2>/dev/null
  ok "config loads"
else
  fail "tmux config failed to load"
fi

echo "symlinks"
for target in "$HOME/.zshrc" "$HOME/.tmux.conf" "$HOME/.config/nvim" "$HOME/.config/starship"; do
  if [[ -L "$target" && -e "$target" ]]; then
    ok "$target"
  else
    fail "$target missing or broken (run: make link)"
  fi
done

echo "secrets"
if [[ -f "$DOTFILES_DIR/zsh/secrets.zsh" ]]; then
  ok "zsh/secrets.zsh exists"
else
  fail "zsh/secrets.zsh missing (run: make link)"
fi

echo "tools"
for cmd in brew nvim tmux starship fzf rg fd bat lsd lazygit delta difft croc tv atuin zoxide volta go; do
  if command -v "$cmd" >/dev/null 2>&1; then
    ok "$cmd"
  else
    fail "$cmd not on PATH (run: make install)"
  fi
done

echo
if [[ $FAILURES -eq 0 ]]; then
  echo "${GREEN}All checks passed ✨${RESET}"
else
  echo "${RED}$FAILURES check(s) failed${RESET}"
  exit 1
fi
