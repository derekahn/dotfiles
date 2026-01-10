# Volta - JavaScript Tool Manager
export VOLTA_HOME="$HOME/.volta"
[[ -d "$VOLTA_HOME/bin" ]] && export PATH="$VOLTA_HOME/bin:$PATH"

# Enable pnpm https://docs.volta.sh/advanced/pnpm
export VOLTA_FEATURE_PNPM=1

alias vr='volta run'

# pnpm - only add to PATH if PNPM_HOME is set
if [[ -n "$PNPM_HOME" && -d "$PNPM_HOME" ]]; then
    export PATH="$PNPM_HOME:$PATH"
fi
