#!/bin/sh
INSTALLDIR=$PWD

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Greetings. Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Checking for Homebrew installation.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)🏠: Homebrew is installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"

  brew update
  brew upgrade
  brew doctor
  brew install cask

else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)🏠: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  echo "---------------------------------------------------------"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi


echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"

packages=(
  "aquasecurity/trivy/trivy"
  "bat"
  "boop"
  "clamav"
  "coreutils"
  "croc"
  "dasel"
  "exa"
  "fd"
  "fx"
  "fzf"
  "git-delta"
  "gnu-sed"
  "golang"
  "httpie"
  "jsonlint"
  "kube-score/tap/kube-score"
  "lazygit"
  "moreutils"
  "n"
  "ncdu"
  "neovim"
  "p7zip"
  "pnpm"
  "prettier"
  "proselint"
  "python3"
  "ranger"
  "reattach-to-user-namespace"
  "ripgrep"
  "rust-analyzer"
  "rustfmt"
  "starship"
  "staticcheck"
  "stylua"
  "syntaqx/tap/serve"
  "tmux"
  "tokei"
  "toshimaru/nyan/nyan"
  "volta"
  "write-good"
  "yamllint"
  "ycd/tap/dstp"
  "zoxide"
  "zsh-syntax-highlighting"
)

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing casks.$(tput sgr 0)"
echo "---------------------------------------------------------"

applications=(
  "1password"
  "alfred"
  "anki"
  "asciinema"
  "db-browser-for-sqlite"
  "firefox"
  "fork"
  "google-chrome"
  "iterm2"
  "nordvpn"
  "rectangle"
  "slack"
  "vivaldi"
)

for i in "${applications[@]}"
do
  brew install --cask $i
  echo "---------------------------------------------------------"
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing system fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"

brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing 🐹 Go things.$(tput sgr 0)"
echo "---------------------------------------------------------"

echo "Please enter your github username (ex: derekahn):"
read user

echo "Created your go workspace at: $HOME/go/src/github.com/$user"
mkdir -p $HOME/go/src/github.com/$user

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

echo "Installing 🐹 go tools: godoc, vet"
go get golang.org/x/tools/cmd/godoc
echo "Tools installed. For more information visit https://golang.org/doc/code.html"

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing 🦀 rust things.$(tput sgr 0)"
echo "---------------------------------------------------------"

curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Manually installing zsh-autosuggestions.$(tput sgr 0)"
echo "---------------------------------------------------------"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: Installing 🌙 LunarVim.$(tput sgr 0)"
echo "---------------------------------------------------------"

/bin/bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)🏠: system update complete. currently running at 100% power. enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
