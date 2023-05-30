# volta
export PATH="/usr/local/sbin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Enable pnpm https://docs.volta.sh/advanced/pnpm
export VOLTA_FEATURE_PNPM=1

alias vr='volta run'

# pnpm
# export PNPM_HOME="~/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# export PNPM_HOME="~/Library/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
